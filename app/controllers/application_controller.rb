class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def authenticate_admin
    unless current_user.admin?

      redirect_to root_path
    end
  end

  def authenticate_student
    unless current_user.student?

      redirect_to root_path
    end
  end

  def authenticate_teacher
    unless current_user.teacher?

      redirect_to root_path
    end
  end


  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:login, :password, :remember_me)}

    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :user_id, :role,:password, :password_confirmation)}

  end
  end

