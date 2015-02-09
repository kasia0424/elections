ActiveAdmin.register AdminUser do
#controller.authorize_resource
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions 
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

member_action :change_role, method: :get do
  end

  controller do
    def change_role
      @user = User.find(params[:id])
    end
  end
end
