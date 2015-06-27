collection :users do
  entity     User
  repository UserRepository

  attribute :id,   Integer
  attribute :name, String
  attribute :email, String
  attribute :password, String
end

collection :posts do
  entity Post
  repository PostRepository

  attribute :id, Integer
  attribute :author_id, Integer
  attribute :content, String
  attribute :created_at, DateTime
  attribute :updated_at, DateTime
end
