require 'rails_helper'

describe 'User can CRUD Users' do

  scenario 'User can create a user and view a show page for a user' do
    visit '/'

    click_on "Users"

    click_on "New Users"

    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "HayleyBlackstock@hotmail.com"


    click_on "Create User"

    expect(page).to have_content("Users")
    expect(page).to have_content("User was successfully created.")
  end

  scenario 'User can edit a user' do
    visit '/users'

    click_on "New Users"

    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "HayleyBlackstock@hotmail.com"


    click_on "Create User"

    click_on "Edit"

    fill_in 'user[first_name]', with: "Katherine"

    click_on "Update User"

    expect(page).to have_content("User was successfully updated.")
  end

  scenario 'User can edit a user' do
    visit '/users'

    click_on "New Users"

    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "HayleyBlackstock@hotmail.com"


    click_on "Create User"

    click_on "Destroy"
            
    expect(page).to have_content("User was successfully destroyed.")

  end

end
