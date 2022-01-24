require 'rails_helper'

describe 'deleting user account process' do
  it 'deletes the account' do
    user = User.create!(:email => 'i@i.com', :password => 'faker11')
    login_as(user, :scope => :user)
    visit '/'
    click_on 'Edit Account'
    click_button 'Cancel my account'
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end