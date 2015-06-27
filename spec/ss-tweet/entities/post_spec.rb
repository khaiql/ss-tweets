require 'spec_helper'

RSpec.describe Post do
  # place your tests here
  let(:attributes) { Set.new([:id, :content, :author_id, :created_at, :updated_at]) }
  it 'defindes attributes' do
    expect(Post.attributes).to eq(attributes)
  end

  describe '#author_name' do
    let(:user) { UserRepository.create(User.new(email: 'dtthaison@gmail.com', password: 'abc123', name: 'Son')) }
    let(:post) { PostRepository.create(Post.new(content: Faker::Lorem.characters(100), author_id: user.id)) }

    it 'returns author\'s name' do
      expect(post.author_name).to eq('Son')
    end
  end

end
