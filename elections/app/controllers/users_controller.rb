class UsersController < ApplicationController
#load_and_authorize_resource

	# GET /users
	# GET /users.json
	def index
	  @users = User.all
	end

	def new
	  @user = User.new
	end

	# GET /users/1
	# GET /users/1.json
	def show
	end

	def create
	  @user = User.new(params[:user])
	  if @user.save
	    flash[:notice] = "Registration successful."
	    redirect_to root_url
	  else
	    flash[:notice] = "There was a problem creating your account."
	    render :action => 'new'
	  end
	end

	def user_params
	  params.require(:user).permit(:email, 
		:password,
		:password_confirmation,
		:role_id)
	end

#	def show
#	  @joined_on = @user.created_at.to_formatted_s(:short)
#	  if @user.current_sign_in_at
#	    @last_login = @user.current_sign_in_at.to_formatted_s(:short)
#	  else
#	    @last_login = "never"
#	  end
#	end

	def edit
	  @user = current_user
	end

	#def update
	#  @user = current_user
	#  if @user.update_attributes(params[:user])
	#    flash[:notice] = "Successfully updated profile."
	#    redirect_to root_url
	#  else
	#    render :action => 'edit'
	#  end
	#end
	def update
	    if params[:id]
	      @user = User.find(params[:id])
	    else
	      @user = current_user
	    end

	    if @user.update_attributes(user_params)
	      flash[:notice] = "Successfully updated profile."
	      redirect_to :back
	    else
	      render :action => 'edit'
	    end

	def destroy
	    @user.destroy
	    respond_to do |format|
	      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	  end
	 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:password, :role, :admin, :email)
    end

end
