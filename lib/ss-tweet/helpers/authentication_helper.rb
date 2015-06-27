module AuthenticationHelper

  def self.included(base)
    base.expose :current_user
  end

  def authenticate!
    if should_redirect_to_login?
      redirect_to '/login'
    end
  end

  def current_user
    @curent_user ||= begin
      if session[:user_id]
        UserRepository.find(session[:user_id])
      end
    end
  end

  private

  def should_redirect_to_login?
    !request_path.empty? && session[:user_id].nil? && !is_login_path &&
    !is_registration_path
  end

  def is_login_path
    !!(request_path =~ /login|logout|sessions/i)
  end

  def is_registration_path
    !!(request_path =~ /registrations/i)
  end

  def request_path
    path = request.path
    if path.empty?
      request = params["request"]
      path = request["path"] if request
    end
    path
  end
end
