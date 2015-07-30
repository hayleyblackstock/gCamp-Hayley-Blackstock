require 'rails_helper'

describe 'User can signin' do

  scenario 'User signin for Taskly' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"
    click_on "Sign Out"
    click_on "Sign In"
    fill_in 'email', with: "hayleyblackstock@gmail.com"
    fill_in 'password', with: "test"
    click_button "Sign In"
    expect(page).to have_content("Hayley Blackstock")
    expect(page).to have_content("Sign Out")
    expect(page).to have_content("Welcome back to Taskly!")

  end

end
