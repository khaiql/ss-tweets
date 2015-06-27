class Post
  include Lotus::Entity

  attributes :id, :content, :author_id, :created_at, :updated_at

  def author_name
    @author_name ||= author.name if author
  end

  private

  def author
    @author ||= UserRepository.find(author_id)
  end
end
