require 'rails_helper'

RSpec.feature 'Following', type: :feature do
  before :each do
    @user = User.create(Fullname: 'Jabali Mburu', Username: 'jabali')
    @user = User.create(Fullname: 'Ann Wambui', Username: 'anne')
  end
  it 'should be able to follow a user' do
    visit login_path
    fill_in 'Username', with: 'jabali'
    click_button 'Log In'
    click_on 'Ann Wambui'
    first(:css, '.font-follow-icon').click
    expect(page).to have_css('.font-unfollow-icon')
  end

  it 'should be able to unfollow a user' do
    visit login_path
    fill_in 'Username', with: 'jabali'
    click_button 'Log In'
    click_on 'Ann Wambui'
    first(:css, '.font-follow-icon').click
    first(:css, '.font-unfollow-icon').click
    expect(page).to have_css('.font-follow-icon')
  end
end
