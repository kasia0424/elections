class ApplicationController < ActionController::Base
  protect_from_forgery


	#od devise
  #before_filter :configure_permitted_parameters, if: :devise_controller?

  #protected
  #def configure_permitted_parameters
  #  devise_parameter_sanitizer.for(:sign_up) << :name
  #  devise_parameter_sanitizer.for(:account_update) << :name
  #end

	#od cancan
  #rescue_from CanCanCan::AccessDenied do |exception|
  #  flash[:error] = "Access denied!"
  #  redirect_to root_url
  #end
  #check_authorization

#  def access_denied(exception)
#    redirect_to user_registration_path, alert: exception.message
#  end

  helper_method :current_user_session, :current_user, :current_order
  #check_authorization
  layout 'application'

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  private

  def current_user_session
    return @current_user if defined?(@current_user_sesssion)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def authenticate
    if !current_user
      redirect_to new_user_session_path
    end
  end
end
