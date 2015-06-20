require 'spec_helper'

RSpec.describe UserRepository do
  # place your tests here
  before do
    UserRepository.all.each do |entity|
      UserRepository.delete(entity)
    end
  end
  describe '#create' do
    subject {UserRepository}
    let(:user) { User.new(name: 'Khai Le', email: 'khai.le@live.co', password: 'password') }
    it 'creates one more record in users table' do
      subject.persist(user)
      expect{subject.create(user)}.to change{UserRepository.all.count}.by(1)
    end
  end
end
