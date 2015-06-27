require 'features_helper'
describe 'visit home page' do
  before do
    UserRepository.clear
    PostRepository.clear
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

    describe 'posts list' do
      it 'hash element with id is posts' do
        expect(page).to have_css 'div#posts'
      end
      context 'user has posts' do
        before do
          PostRepository.create(Post.new(content: Faker::Lorem.characters(100), author_id: user.id))
          visit '/'
        end
        it 'has element with class is post-item' do
          expect(page).to have_css 'div#posts div.post-item'
        end
        it 'has author name element' do
          expect(page).to have_css 'div#posts div.post-item .author'
        end
        it 'has timestamp element' do
          expect(page).to have_css 'div#posts div.post-item .timestamp'
        end
        it 'has post content element' do
          expect(page).to have_css 'div#posts div.post-item .content'
        end
      end
      context 'user has no posts' do
        it 'has content of #posts element is empty' do
          expect(page).not_to have_css 'div#posts div.post-item'
        end
      end
    end
  end
end
