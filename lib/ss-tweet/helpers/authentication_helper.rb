require 'lotus/action/session'

module AuthenticationHelper
  def authenticate!
    if session[:user_id].nil? && !is_login_path && !is_registration_path
      redirect_to '/login'
    end
  end

  def current_user
    if session[:user_id]
      UserRepository.find(session[:user_id])
    end
  end

  private

  def is_login_path
    !!(request.path =~ /login|sessions/i)
  end

  def is_registration_path
    !!(request.path =~ /registrations/i)
  end
end