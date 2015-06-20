require 'features_helper'

describe 'redirect to login page' do
  it 'shows login page for non-login user access to home page' do
    visit '/'
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
  end
end