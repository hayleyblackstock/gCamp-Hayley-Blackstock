require 'rails_helper'

 describe 'User can CRUD tasks' do

  scenario 'User can create a task and view a show page for a task' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"
    click_on "Projects"
    click_on "New Project"
    fill_in 'project[name]', with: "Test"
    click_on "Create Project"
    click_on "Test"
    click_on "0 Tasks"

    click_on "New Task"

    fill_in 'task[description]', with: "Test"

    click_on "Create Task"

    expect(page).to have_content("Test")
    expect(page).to have_content("Task was successfully created.")
  end

  scenario 'User can edit a task' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"
    click_on "Projects"
    click_on "New Project"
    fill_in 'project[name]', with: "Test"
    click_on "Create Project"
    click_on "Test"
    click_on "0 Tasks"
    click_on "New Task"
    fill_in 'task[description]', with: "Test"
    click_on "Create Task"

    click_on "Edit"

    expect(page).to have_content("Editing Task")

    click_on "Update Task"

    expect(page).to have_content("Task was successfully updated.")

  end

  scenario 'User can delete a task' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"
    click_on "Projects"
    click_on "New Project"
    fill_in 'project[name]', with: "Test"
    click_on "Create Project"
    click_on "Test"
    click_on "0 Tasks"
    click_on "New Task"
    fill_in 'task[description]', with: "Test"
    click_on "Create Task"
    click_on "Edit"

    click_on "Cancel"

    click_on "Destroy"

    expect(page).to have_content("Task was successfully destroyed.")

  end

  end
