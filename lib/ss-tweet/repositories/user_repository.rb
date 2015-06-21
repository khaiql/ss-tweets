class UserRepository
  include Lotus::Repository

  def self.check_credentials(hash = {})
    query.where(email: hash[:email], password: hash[:password]).first
  end
end
