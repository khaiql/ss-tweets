class Post
  include Lotus::Entity

  attributes :id, :content, :author_id, :created_at, :updated_at
end
