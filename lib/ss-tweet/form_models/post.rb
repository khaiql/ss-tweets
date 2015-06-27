require 'lotus/validations'

module FormModels
  class Post
    include Lotus::Validations

    attribute :content, presence: true, size: 1..160
    attribute :author_id, presence: true
  end
end
