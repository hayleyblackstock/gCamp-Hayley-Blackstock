require 'rails_helper'

describe 'User can CRUD projects' do

  scenario 'User can create a project' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"

    fill_in 'project[name]', with: "Test"

    click_on "Create Project"

    expect(page).to have_content("Test")
    expect(page).to have_content("Project was successfully created.")
  end

  scenario 'User can view a show page for a project' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"

    fill_in 'project[name]', with: "Help"

    click_on "Create Project"

    visit '/users'

    click_link('Help')

    expect(page).to have_content("Help")
  end

  scenario 'User can edit a project' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"

    fill_in 'project[name]', with: "Test"

    click_on "Create Project"

    visit '/users'

    click_on "Test"

    click_on "Edit"

    fill_in 'project[name]', with: "Test2"

    click_on "Update Project"

    expect(page).to have_content("Test2")

  end

  scenario 'User can delete a project' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"

    fill_in 'project[name]', with: "Test"

    click_on "Create Project"

    visit '/users'

    click_on "Test"

    click_on "Delete"

    expect(page).to have_content("Project was successfully Destoryed.")
  end

end
