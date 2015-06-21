module Web::Controllers::Sessions
  class Create
    include Web::Action

    def call(params)
      byebug
      sign_in = SignIn.new(params[:sign_in])
      if sign_in.valid?
        user = UserRepository.check_credentials(sign_in.to_h)
        if user
          session[:user_id] = user.id
          redirect_to '/'
        end
      end
    end
  end
end
