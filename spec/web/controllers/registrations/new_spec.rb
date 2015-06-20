require 'spec_helper'
require_relative '../../../../apps/web/controllers/registrations/new'

describe Web::Controllers::Registrations::New do
  let(:action) { Web::Controllers::Registrations::New.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
