require 'spec_helper'

RSpec.describe PostRepository do
  subject { PostRepository }
  let(:user) { UserRepository.create(User.new(email: 'khai.le@live.com', password: 'abc123', name: 'Khai')) }
  let(:post) { Post.new }

  before do
    UserRepository.clear
    PostRepository.clear
  end

  shared_examples 'invalid object' do
    it 'raises exception' do
      expect { subject.persist(post) }.to raise_exception
    end
  end
  # place your tests here
  context 'valid post object' do
    it 'increases posts count' do
      post.content = 'abc123 con ga'
      post.author_id = user.id
      expect { subject.create(post) }.to change{subject.all.count}.by(1)
    end
  end
  context 'invalid post object' do
    context 'content is too long' do
      before do
        post.author_id = user.id
        post.content = Faker::Lorem.characters(200)
      end

      it_behaves_like 'invalid object'
    end
    context 'author_id is nil' do
      before do
        post.author_id = nil
        post.content = Faker::Lorem.characters(150)
      end
      it_behaves_like 'invalid object'
    end
  end

  describe '.posts_of_user' do
    it 'returns all posts of user' do
      subject.create(Post.new(author_id: user.id, content: Faker::Lorem.characters(100)))
      subject.create(Post.new(author_id: user.id, content: Faker::Lorem.characters(100)))
      expect(subject.posts_of_user(user.id).count).to eq(2)
    end
    it 'returns empty array if author_id does not exist' do
      expect(subject.posts_of_user(0).count).to eq 0
    end
    it 'returns empty array if author does not create posts before' do
      expect(subject.posts_of_user(user.id).count).to eq 0
    end
  end
end
