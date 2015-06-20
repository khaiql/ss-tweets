require 'lotus/validations'

class SignUp
  include Lotus::Validations

  attribute :name, presence: true
  attribute :email, presence: true, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  attribute :password, presence: true, confirmation: true

  def make_user
    User.new(name: name, email: email, password: password)
  end
end