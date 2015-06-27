require 'spec_helper'
require_relative '../../../../apps/web/controllers/posts/create'

describe Web::Controllers::Posts::Create do
  let(:user) { UserRepository.create(User.new(email: 'dtthaison@gmail.com', password: 'abc123', name: 'son')) }
  let(:action) { Web::Controllers::Posts::Create.new }
  let(:params) { Hash[post: {content: Faker::Lorem.characters(100)}] }

  before do
    PostRepository.clear
    UserRepository.clear

    allow(action).to receive(:session).and_return({user_id: user.id})
  end

  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq 302
    expect(response[1]['LOCATION']).to eq '/'
  end

  context 'valid content' do
    it 'increase posts count' do
      expect{action.call(params)}.to change{PostRepository.all.count}.by(1)
    end

    it 'has author is current_user' do
      action.call(params)
      post = PostRepository.all.last
      expect(post.author_id).to eq(user.id)
    end
  end

  context 'invalid content' do
    before do
      params[:post][:content] = Faker::Lorem.characters(200)
    end
    it 'does not increase posts count' do
      expect{action.call(params)}.to change{PostRepository.all.count}.by(0)
    end
  end

end
