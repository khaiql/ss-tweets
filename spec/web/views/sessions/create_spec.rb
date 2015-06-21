require 'spec_helper'
require_relative '../../../../apps/web/views/sessions/create'

describe Web::Views::Sessions::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/sessions/create.html.slim') }
  let(:view)      { Web::Views::Sessions::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
