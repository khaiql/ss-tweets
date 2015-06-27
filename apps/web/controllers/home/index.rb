module Web::Controllers::Home
  class Index
    include Web::Action

    expose :posts

    def call(params)
      @posts = PostRepository.posts_of_user(current_user.id)
    end
  end
end
