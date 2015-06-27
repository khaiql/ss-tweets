require 'spec_helper'

describe FormModels::Post do
  subject { FormModels::Post.new }
  it 'is valid if has content and author_id' do
    subject.content = Faker::Lorem.characters(100)
    subject.author_id = 1
    expect(subject.valid?).to eq(true)
  end
  it 'is invalid if content is nil' do
    subject.content = nil
    subject.author_id = 1
    expect(subject.valid?).to eq(false)
  end
  it 'is invalid if content has more than 160 chars' do
    subject.content = Faker::Lorem.characters(200)
    subject.author_id = 1
    expect(subject.valid?).to eq(false)
  end
  it 'is invalid if author_id is nil' do
    subject.content = Faker::Lorem.characters(100)
    subject.author_id = nil
    expect(subject.valid?).to eq(false)
  end
end
