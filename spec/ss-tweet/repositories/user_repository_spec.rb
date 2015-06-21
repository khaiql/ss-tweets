require 'spec_helper'

RSpec.describe UserRepository do
  subject {UserRepository}
  # place your tests here
  before do
    UserRepository.clear
  end
  describe '#create' do
    let(:user) { User.new(name: 'Khai Le', email: 'khai.le@live.co', password: 'password') }
    it 'creates one more record in users table' do
      subject.persist(user)
      expect{subject.create(user)}.to change{UserRepository.all.count}.by(1)
    end
  end

  describe '#check_credentials' do
    context 'valid credentials' do
      before do
        user = User.new(email: 'khai.le@live.com', password: '123')
        UserRepository.create(user)
      end
      it 'returns user instance' do
        result = subject.check_credentials(email: 'khai.le@live.com', password: '123')
        expect(result.id).not_to be_nil
      end
    end

    context 'invalid credentials' do
      it 'returns nil' do
         result = subject.check_credentials(email: 'khai.le@live.com', password: '123')
         expect(result).to be_nil
      end
    end
  end
end
