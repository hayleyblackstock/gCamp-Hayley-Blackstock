require 'rails_helper'

describe 'User can CRUD Users' do

  scenario 'User can create a user' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"
    click_on "Users"

    click_on "New Users"

    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "HayleyBlackstock@hotmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"

    click_on "Create User"

    expect(page).to have_content("Users")
    expect(page).to have_content("User was successfully created.")
  end

  scenario 'User can visit the show page for a user' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"
    click_on "Users"

    click_on "New Users"

    fill_in 'user[first_name]', with: "Bobby"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "BobbyBlackstock@hotmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"

    click_on "Create User"

    click_on "Bobby Blackstock"

    expect(page).to have_content("Bobby Blackstock")
  end


  scenario 'User can edit a user' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"
    click_on "Users"
    click_on "Edit"

    fill_in 'user[first_name]', with: "Katherine"

    click_on "Update User"

    expect(page).to have_content("User was successfully updated.")
  end

  scenario 'User can edit a user' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"
    click_on "Users"
    click_on "Edit"
    click_on 'Delete'

    expect(page).to have_content("gCamp")

  end

end
