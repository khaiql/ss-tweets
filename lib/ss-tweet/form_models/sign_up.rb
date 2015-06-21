require 'lotus/validations'
require_relative '../helpers/email_validation'

class SignUp
  include Lotus::Validations
  include ::EmailValidation

  attribute :name, presence: true
  # attribute :email, presence: true, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  attribute :password, presence: true, confirmation: true

  def make_user
    User.new(name: name, email: email, password: password)
  end
end