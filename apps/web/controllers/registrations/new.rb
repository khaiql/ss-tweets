module Web::Controllers::Registrations
  class New
    include Web::Action

    expose :sign_up
    def call(params)
      byebug
    end
  end
end
