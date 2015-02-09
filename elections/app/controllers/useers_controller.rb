class UseersController < ApplicationController
  #before_filter :set_useer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @useers = Useer.all
    respond_with(@useers)
  end

  def change_role
      @user = Useer.find(params[:id])
      @role = Role.all.map do |rol|
	[rol.id]
     end
  end

  def show
    respond_with(@useer)
  end

  def new
    @useer = Useer.new
    @const = Constituency.all.map do |cons|
	[cons.id]
     end
    respond_with(@useer)
  end

  def edit
	@useer = Useer(params[:useer])
	@roles = Role.all
	
  end

  def create
    @useer = Useer.new(params[:useer])
    @useer.save
    respond_with(@useer)
  end

  def update
    @useer.update_attributes(params[:useer])
    respond_with(@useer)
  end

  def destroy
    @useer.destroy
    respond_with(@useer)
  end

  private
    def set_useer
      @useer = Useer.find(params[:id])
    end
end
