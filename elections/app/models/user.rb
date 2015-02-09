class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable#, :rememberable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation#, :remember_me
  # attr_accessible :title, :body
  belongs_to :constituency
  belongs_to :role

  #validates_presence_of :name
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "admin" if self.role.nil?
  end

  def admin?
    self.role.name == "admin"
  end

  def okregowy?
    self.role.name == "okregowy"
  end

  def centralny?
    self.role.name == "centralny"
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end
