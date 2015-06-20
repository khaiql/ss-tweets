describe SignUp do
  describe '#validate' do
    subject { SignUp.new(email: 'khai.le@live.com', name: 'Khai Le',
        password: '123', password_confirmation: '123')}

    context 'when valid' do
      it 'is valid' do
        expect(subject.valid?).to eq(true)
      end
    end

    context 'invalid' do
      it 'validates email presence' do
        subject.email = nil
        expect(subject.valid?).to eq(false)
        expect(subject.errors.for(:email)).not_to be_nil
      end

      it 'validates name presence' do
        subject.name = nil
        expect(subject.valid?).to eq(false)
        expect(subject.errors.for(:name)).not_to be_nil
      end

      it 'validates password presence' do
        subject.password = nil
        expect(subject.valid?).to eq(false)
        expect(subject.errors.for(:password)).not_to be_nil
      end

      it 'validate password confirmation match' do
        subject.password_confirmation = '321'
        expect(subject.valid?).to eq(false)
        expect(subject.errors.for(:password_confirmation)).not_to be_nil
      end

      it 'validates email format' do
        subject.email = 'abc'
        expect(subject.valid?).to eq(false)
        expect(subject.errors.for(:email)).not_to be_nil
      end
    end
  end
end