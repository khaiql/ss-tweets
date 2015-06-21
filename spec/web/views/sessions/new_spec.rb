require 'spec_helper'
require_relative '../../../../apps/web/views/sessions/new'

describe Web::Views::Sessions::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/sessions/new.html.erb') }
  let(:view)      { Web::Views::Sessions::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
