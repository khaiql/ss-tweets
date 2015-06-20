require 'features_helper'
describe 'visit home page' do
  before do
    visit '/'
  end

  context 'when login with Guest user' do
    it 'should have app title' do
      expect(page).to have_content('SS Tweets')
    end

    it 'should have Home on Nav bar' do
      expect(page).to have_content('Home')
    end

    it 'should have Login on Nav bar' do
      expect(page).to have_content('Sign in')
    end

    it 'should have About on Nav bar' do
      expect(page).to have_content('About')
    end
  end
end