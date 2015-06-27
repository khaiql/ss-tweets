module Web::Controllers::Posts
  class Create
    include Web::Action



    def call(params)
      post_form = FormModels::Post.new(params[:post])
      post_form.author_id = current_user.id
      if post_form.valid?
        PostRepository.create(Post.new(post_form.to_h))
        redirect_to '/'
      end
    end
  end
end
