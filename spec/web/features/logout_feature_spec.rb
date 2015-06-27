require 'features_helper'

describe 'logout feature' do
  include_context 'login user'
  it 'redirects to login page' do
    click_link 'Logout'
    expect(page).to have_content 'Sign in'
  end
end
