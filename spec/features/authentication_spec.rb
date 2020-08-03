require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(Fullname: 'user', Username: 'user1')
  end

  it 'should Register' do
    visit signup_path
    fill_in 'Fullname', with: 'test_user'
    fill_in 'Username', with: 'testuser1'
    click_button 'Sign Up'
    expect(page).to have_content('Log In')
  end

  it 'should Login' do
    visit root_path
    fill_in 'Username', with: 'user1'
    click_button 'Log In'
    expect(page).to have_content('HOME')
    expect(page).to have_content('PROFILE')
    expect(page).to have_content('LOGOUT')
  end

  it 'should Logout' do
    visit root_path
    fill_in 'Username', with: 'user1'
    click_button 'Log In'
    expect(page).to have_content('HOME')
    expect(page).to have_content('PROFILE')
    click_on 'LOGOUT'
    expect(page).to have_content('Log In')
  end
end
