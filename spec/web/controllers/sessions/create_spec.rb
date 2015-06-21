require 'spec_helper'
require_relative '../../../../apps/web/controllers/sessions/create'

describe Web::Controllers::Sessions::Create do
  let(:action) { Web::Controllers::Sessions::Create.new }
  let(:params) { Hash[sign_in: {email: 'khai.le@live.com', password: '123'}] }

  before do
    UserRepository.clear
  end

  context 'valid credentials' do
    before do
      UserRepository.create(User.new(email: 'khai.le@live.com', password: '123'))
    end
    it 'redirects to home page' do
      response = action.call(params)
      expect(response[0]).to eq 302
      expect(response[1]['Location']).to eq('/')
    end

    it 'sets user_id to sessions' do
      response = action.call(params)
      expect(response[1]['Set-Cookie'].index('rack.session')).to be >= 0
    end
  end

  context 'invalid credentials' do
    it 'rerenders login page' do
      response = action.call(params)
      expect(response[0]).to eq 200
    end
  end
end
