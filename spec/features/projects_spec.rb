require 'rails_helper'

describe 'User can CRUD projects' do

  scenario 'User can create a project' do
    visit '/'

    click_on "Projects"

    click_on "New Project"

    fill_in 'project[name]', with: "Test"

    click_on "Create Project"

    expect(page).to have_content("Test")
    expect(page).to have_content("Project was successfully created.")
  end

  scenario 'User can view a show page for a project' do
    visit '/projects'

    click_on "New Project"

    fill_in 'project[name]', with: "Test"

    click_on "Create Project"

    click_on "Test"

    expect(page).to have_content("Test")
  end

  scenario 'User can edit a project' do
  @project = Project.create(name: "Test")

    visit '/projects'

    click_on "Test"

    click_on "Edit"

    fill_in 'project[name]', with: "Test2"

    click_on "Update Project"

    expect(page).to have_content("Test2")

  end

  scenario 'User can delete a project' do
    @project = Project.create(name: "Test")

    visit '/projects'

    click_on "Destroy"

    expect(page).to have_content("Project was successfully Destoryed.")
  end

end