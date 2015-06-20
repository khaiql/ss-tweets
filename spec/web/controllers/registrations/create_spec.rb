require 'spec_helper'
require_relative '../../../../apps/web/controllers/registrations/create'

describe Web::Controllers::Registrations::Create do
  let(:action) { Web::Controllers::Registrations::Create.new }


  context 'with valid params' do
    let(:params) { Hash[sign_up: {email: 'khai.le@live.com', name: 'Khai',
                                  password: 'abc123',
                                  password_confirmation: 'abc123'}] }
    it 'redirect to login page' do
      puts params
      response = action.call(params)
      puts response
      expect(response[0]).to eq 302
      expect(response[1]['Location']).to eq '/login'
    end

    it 'create a new user record' do
      expect { action.call(params) }.to change{UserRepository.all.count}.by(1)
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[sign_up: {email: 'khai.le@live.com', name: 'Khai',
                                  password: 'abc123',
                                  password_confirmation: 'abc1234'}] }
    it 're-renders the registrations#new view' do
      response = action.call(params)
      expect(response[0]).to eq 200
    end
  end
end
