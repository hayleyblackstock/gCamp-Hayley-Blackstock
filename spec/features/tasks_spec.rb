require 'rails_helper'

 describe 'User can CRUD tasks' do

  scenario 'User can create a task and view a show page for a task' do
    visit '/'

    click_on "Tasks"

    click_on "New Task"

    fill_in 'task[description]', with: "Test"

    click_on "Create Task"

    expect(page).to have_content("Test")
    expect(page).to have_content("Task was successfully created.")
  end

  scenario 'User can edit a task' do
    visit '/tasks'

    click_on "New Task"

    fill_in 'task[description]', with: "Test"

    click_on "Create Task"

    click_on "Edit"

    expect(page).to have_content("Editing Task")

    click_on "Update Task"

    expect(page).to have_content("Task was successfully updated.")

  end

  scenario 'User can delete a task' do
    visit '/tasks'

    click_on "New Task"

    fill_in 'task[description]', with: "Test"

    click_on "Create Task"

    click_on "Edit"

    click_on "Cancel"

    click_on "Destroy"

    expect(page).to have_content("Task was successfully destroyed.")

  end

  end
