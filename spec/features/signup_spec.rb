require 'rails_helper'

describe 'User can signup' do

  scenario 'User signup for gCamp' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"
    expect(page).to have_content("gCamp Your life, organized.")
  end

end
