class PostRepository
  include Lotus::Repository

  def self.posts_of_user(author_id)
    query.where(author_id: author_id).desc
  end
end
