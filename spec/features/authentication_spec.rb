require 'rails_helper'
# rubocop: disable Metrics/BlockLength
RSpec.feature 'Authentications', type: :feature do
  before :each do
    @user = User.create(Fullname: 'user', Username: 'user1')
  end

  it 'should Register' do
    visit signup_path
    fill_in 'Fullname', with: 'test_user'
    fill_in 'Username', with: 'testuser1'
    click_button 'Sign Up'
    expect(page).to have_content('Successfully Registered')
  end

  it 'does not redirect to homepage if the username is taken' do
    visit signup_path
    fill_in 'Fullname', with: 'test_user'
    fill_in 'Username', with: 'testuser1'
    click_button 'Sign Up'
    expect(page).to have_content('')
  end

  it 'should Login' do
    visit root_path
    fill_in 'Username', with: 'user1'
    click_button 'Log In'
    expect(page).to have_content('HOME')
    expect(page).to have_content('PROFILE')
    expect(page).to have_content('LOGOUT')
  end

  it 'should not Login a user with invalid Username' do
    visit root_path
    fill_in 'Username', with: 'user1777'
    click_button 'Log In'
    expect(page).to have_content('Incorrect username, please try again or register first.')
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
# rubocop: enable Metrics/BlockLength
