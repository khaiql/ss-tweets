require 'spec_helper'
require_relative '../../../../apps/web/views/sessions/destroy'

describe Web::Views::Sessions::Destroy do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/sessions/destroy.html.slim') }
  let(:view)      { Web::Views::Sessions::Destroy.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
