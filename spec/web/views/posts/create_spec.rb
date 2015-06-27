require 'spec_helper'
require_relative '../../../../apps/web/views/posts/create'

describe Web::Views::Posts::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/posts/create.html.slim') }
  let(:view)      { Web::Views::Posts::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
