module Web::Controllers::Sessions
  class Destroy
    include Web::Action

    def call(params)
      session.delete(:user_id)
      redirect_to '/login'
    end
  end
end
