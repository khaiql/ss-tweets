require 'spec_helper'
require 'rack/mock'

describe 'AuthenticationHelper' do
  let(:dummy_class) do
    cls = Class.new do
      include Web::Action
      include Lotus::Action::Session
      include AuthenticationHelper
      before :authenticate!
    end
  end

  before do
    @action = dummy_class.new
  end

  describe '#current_user' do
    before do
      @user = UserRepository.create(User.new(email: 'kl', name: 'kl'))
    end

    context 'when session has user_id' do
      before do
        allow(@action).to receive(:session).and_return({:user_id => @user.id})
      end
      it 'return user action' do
        env = Rack::MockRequest.env_for('/', {})
        @action.call(env)
        expect(@action.current_user).to eq(@user)
      end
    end

    context 'when session has no user_id' do
      it 'return nil' do
        env = Rack::MockRequest.env_for('/', {})
        @action.call(env)
        expect(@action.current_user).to be_nil
      end
    end
  end
end