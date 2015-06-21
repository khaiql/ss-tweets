require 'lotus/validations'
require_relative '../helpers/email_validation'

class SignIn
  include Lotus::Validations
  include ::EmailValidation

  attribute :password, presence: true
end