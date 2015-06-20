collection :users do
  entity     User
  repository UserRepository

  attribute :id,   Integer
  attribute :name, String
  attribute :email, String
  attribute :password, String
end