module EmailValidation
  def self.included(base)
    base.attribute :email, presence: true, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  end
end