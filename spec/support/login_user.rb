RSpec.shared_context 'login user' do
  before do
    UserRepository.create(User.new(email: 'khai.le@live.com', password: 'abc123', name: 'Khai'))
    visit '/login'
    fill_in 'Email', with: 'khai.le@live.com'
    fill_in 'Password', with: 'abc123'
    click_button 'Sign In'
  end
end
