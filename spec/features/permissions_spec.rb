require 'rails_helper'

describe 'permissions for different users' do

  before :each do
    @user = User.create(first_name: 'Hayley',
    last_name: 'Blackstock',
    email:'hayleyblackstock@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    admin: false)
    visit '/signin'
    fill_in "Email", with: 'hayleyblackstock@gmail.com'
    fill_in "Password", with: 'password'
    within('form') do
      click_on 'Sign In'
    end
    expect(page).to have_content 'Welcome back to gCamp!'
  end

  scenario 'redirect to projects page after sign in' do
    visit '/signin'
    fill_in "Email", with: 'hayleyblackstock@gmail.com'
    fill_in "Password", with: 'password'
    click_on 'Sign In'
    expect(page).to have_content 'New Project'
    expect(page).to have_content 'Projects'

  end

  scenario 'user is owner of events after created' do
    visit '/projects'
    within ('.navbar') do
      click_on 'New Project'
    end
    fill_in('Name', with: 'This is a Test Project')
    click_button 'Create Project'
    expect(page).to have_content 'Project was successfully created.'
    within ('.breadcrumb') do
      click_on 'This is a Test Project'
    end
    click_link '1 Membership'
    expect(page).to have_content 'This is a Test Project: Manage Members'
  end

  scenario 'user can only see projects they are members of' do
    @project = Project.create(name: 'Better Not See Me')
    expect(page).not_to have_content 'Better Not See Me'
  end

  scenario 'only project owners can see edit button and delete' do
    visit '/projects'
    within ('.navbar') do
      click_on 'New Project'
    end
    fill_in('Name', with: 'Please Work')
    click_button 'Create Project'
    visit '/projects'
    within ('.navbar') do
      click_on 'Please Work'
    end
    expect(page).to have_content 'Edit'
    expect(page).to have_content 'Delete'
  end

  scenario 'logged in users cant edit other users' do
    visit '/users'
    click_on 'New User'
    fill_in "First name", with: 'Shelby'
    fill_in "Last name", with: 'Kelly'
    fill_in "Email", with: 'ShelbyKelly@gmail.com'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Create User"
    visit '/users'
    within ('body') do
      click_on 'Shelby Kelly'
    end
    expect(page).not_to have_content 'Edit'
  end

  scenario 'users only see their email address on users index' do
    visit '/users'
    click_on 'New User'
    fill_in "First name", with: 'Shelby'
    fill_in "Last name", with: 'Kelly'
    fill_in "Email", with: 'ShelbyKelly@gmail.com'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Create User"
    visit '/users'
    expect(page).not_to have_content 'ShelbyKelly@gmail.com'
  end

  scenario 'user restricted from projects they arent members of' do
    @no_access_project = Project.create(name: 'Not my project')
    visit project_path(@no_access_project)
    expect(page).to have_content 'You do not have access to that project.'
  end
end
