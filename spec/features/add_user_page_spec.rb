require 'rails_helper'

describe "add a new user process" do

  it "signs up for a new account" do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', :with => "i@i.com"
    fill_in 'Password', :with => "faker11"
    fill_in 'Password confirmation', :with => "faker11"
    click_on 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end