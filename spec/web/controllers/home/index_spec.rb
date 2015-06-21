require 'spec_helper'
require 'rack/mock'

require_relative '../../../../apps/web/controllers/home/index'

describe Web::Controllers::Home::Index do
  let(:action) { Web::Controllers::Home::Index.new }
  let(:params) { Hash[] }

  context 'guest user' do
    it 'redirects to login page' do
      env = Rack::MockRequest.env_for('/', {})
      status, headers, _ = action.call(env)
      expect(status).to eq(302)
      expect(headers['LOCATION']).to eq('/login')
    end
  end

  context 'signed in user' do
    before do
      allow(action).to receive(:session).and_return({user_id: 1})
    end
    it 'returns 200 status code' do
      env = Rack::MockRequest.env_for('/', {})
      status, _, _ = action.call(env)
      expect(status).to eq(200)
    end
  end

end
