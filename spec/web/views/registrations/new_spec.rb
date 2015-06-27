require 'spec_helper'
require_relative '../../../../apps/web/views/registrations/new'

describe Web::Views::Registrations::New do
  let(:sign_up) { SignUp.new }
  let(:exposures) { Hash[sign_up: sign_up] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/registrations/new.html.slim') }
  let(:view)      { Web::Views::Registrations::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #sign_up" do
    expect(view.sign_up).to eq exposures.fetch(:sign_up)
  end
end
