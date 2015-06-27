require 'spec_helper'

RSpec.describe Post do
  # place your tests here
  let(:attributes) { Set.new([:id, :content, :author_id, :created_at, :updated_at]) }
  it 'defindes attributes' do
    expect(Post.attributes).to eq(attributes)
  end

end
