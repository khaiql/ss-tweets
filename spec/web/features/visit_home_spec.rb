require 'features_helper'
describe 'visit home page' do
  before do
    visit '/'
  end

  shared_examples 'default page' do
    it 'should have app title' do
      expect(page).to have_content('SS Tweets')
    end

    it 'should have Home on Nav bar' do
      expect(page).to have_content('Home')
    end

    it 'should have About on Nav bar' do
      expect(page).to have_content('About')
    end
  end

  context 'when login with Guest user' do
    it_behaves_like 'default page'
    it 'should have Login on Nav bar' do
      expect(page).to have_content('Sign in')
    end
  end

  context 'when login with user account' do
    let!(:user) { UserRepository.create(User.new(email: 'khai.le@gmail.com', password: 'abc123', name: 'Khai')) }
    before do
      visit '/login'
      fill_in 'Email', with: 'khai.le@gmail.com'
      fill_in 'Password', with: 'abc123'
      click_button 'Sign In'
    end
    it_behaves_like 'default page'
    it 'should have Logout on Nav bar' do
      expect(page).to have_content('Logout')
    end

    it 'has post textarea' do
      expect(page).to have_css('form #post_content')
    end
    it 'has submit button' do
      expect(page).to have_css('form button[type=submit]')
    end
  end
end
