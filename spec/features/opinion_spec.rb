require 'rails_helper'

RSpec.feature 'Opinion', type: :feature do
  before :each do
    @user = User.create(Fullname: 'Jabali Mburu', Username: 'jabali')
    @user = User.create(Fullname: 'Ann Wambui', Username: 'anne')
    Opinion.create(AuthorId: @user.id, Text: 'Best movie ever')
  end

  it 'should create an opinion' do
    visit root_path
    fill_in 'Username', with: 'jabali'
    click_button 'Log In'
    fill_in 'opinion[Text]', with: 'a new opinion'
    click_button 'POST'
    expect(page).to have_content('HOME')
    expect(page).to have_content('PROFILE')
    expect(page).to have_content('LOGOUT')
  end

  it 'should does not create an opinion less than 3 characters' do
    visit root_path
    fill_in 'Username', with: 'jabali'
    click_button 'Log In'
    fill_in 'opinion[Text]', with: ''
    click_button 'POST'
    expect(page).to have_content('Opinion cannot be less than 3 or more than 250 characters.')
  end
end
