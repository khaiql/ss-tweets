require 'spec_helper'
require_relative '../../../../apps/web/controllers/home/index'

describe Web::Controllers::Home::Index do
  let(:action) { Web::Controllers::Home::Index.new }
  let(:params) { Hash[] }

  context 'known user' do
    before do
      allow(action).to receive(:session).and_return({ user_id: 1})
    end
    it "is successful" do
      response = action.call(params)
      expect(response[0]).to eq 200
    end
  end

  context 'guest user' do
    it 'redirect to login page' do
      response = action.call(params)
      expect(response[0]).to eq(302)
    end
  end
end
