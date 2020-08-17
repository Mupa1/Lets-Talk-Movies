require 'rails_helper'

RSpec.feature 'Like', type: :feature do
  before :each do
    @user = User.create(Fullname: 'Jabali Mburu', Username: 'jabali')
    @user = User.create(Fullname: 'Ann Wambui', Username: 'anne')
    Opinion.create(AuthorId: @user.id, Text: 'best movie ever')
  end

  it 'should like a created opinion' do
    visit root_path
    fill_in 'Username', with: 'jabali'
    click_button 'Log In'
    fill_in 'opinion[Text]', with: 'This is an opinion'
    click_button 'POST'
    first(:css, '.user-2').click
    expect(page).to have_content('1 like')
  end

  it 'Should unlike an opinion' do
    visit root_path
    fill_in 'Username', with: 'jabali'
    click_button 'Log In'
    fill_in 'opinion[Text]', with: 'This is an opinion'
    click_button 'POST'
    first(:css, '.user-2').click
    first(:css, '.user-1').click
    expect(page).to_not have_content('1 like')
  end
end
