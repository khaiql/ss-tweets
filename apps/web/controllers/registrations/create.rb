module Web::Controllers::Registrations
  class Create
    include Web::Action

    def call(params)
      sign_up = SignUp.new(params[:sign_up])
      if sign_up.valid?
        UserRepository.create(sign_up.make_user)
        redirect_to '/login'
      end
    end
  end
end
