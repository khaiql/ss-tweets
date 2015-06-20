require 'features_helper'

describe 'login page' do
  context 'guest user' do
    before do
      visit '/login'
    end
    it 'should have email field' do
      expect(page).to have_content('Email')
    end

    it 'should have password field' do
      expect(page).to have_content('Password')
    end
  end
end