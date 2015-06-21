describe SignIn do
  describe 'validation' do
    subject { SignIn.new(email: 'khai.le@live.com', password: '123')}
    context 'valid sign in' do
      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'invalid' do
      before do
        subject.email = 'khai.le@live.com'
        subject.password = '123'
      end
      it 'validates email presence' do
        subject.email = nil
        expect(subject).not_to be_valid
        expect(subject.errors.for(:email).size).to be > 0
      end

      it 'validates password presence' do
        subject.password = nil
        expect(subject).not_to be_valid
        expect(subject.errors.for(:password).size).to be > 0
      end

      it 'validates email format' do
        subject.email = 'con ga'
        expect(subject).not_to be_valid
        expect(subject.errors.for(:email).size).to be > 0
      end
    end
  end
end