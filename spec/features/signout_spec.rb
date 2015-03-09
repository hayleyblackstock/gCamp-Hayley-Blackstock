require 'rails_helper'

describe 'User can signout' do

  scenario 'User signout of gCamp' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"
    click_on "Sign Out"
    expect(page).to have_content("You are successfully signed out! Come back soon!")
  end

end
