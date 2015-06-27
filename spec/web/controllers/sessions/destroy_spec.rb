require 'spec_helper'
require_relative '../../../../apps/web/controllers/sessions/destroy'

describe Web::Controllers::Sessions::Destroy do
  let(:action) { Web::Controllers::Sessions::Destroy.new }
  let(:params) { Hash[] }

  before do
    allow(action).to receive(:session).and_return({user_id: 1})
  end

  # it "is successful" do
  #   response = action.call(params)
  #   expect(response[0]).to eq 200
  # end

  it 'destroys user id in session' do
    action.call(params)
    expect(action.send :session).not_to have_key :user_id
  end

  it 'redirects to login page' do
    code, headers, _ = action.call(params)
    expect(code).to eq 302
    expect(headers['LOCATION']).to eq '/login'
  end
end
