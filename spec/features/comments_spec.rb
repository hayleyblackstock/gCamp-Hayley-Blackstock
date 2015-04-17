require 'rails_helper'

describe 'User comments' do

  scenario 'User can create a project' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Hayley"
    fill_in 'user[last_name]', with: "Blackstock"
    fill_in 'user[email]', with: "hayleyblackstock@gmail.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_on "Create User"
    fill_in 'project[name]', with: "Comments"
    click_on "Create Project"
    visit '/'
    click_on "Comments"

    click_on "0 Task"

    click_on "New Task"

    fill_in 'task[description]', with: "Test"

    click_on "Create Task"

    click_on "Test"
    fill_in 'comment[description]', with: "this is the message"
    click_on "Add Comment"
    expect(page).to have_content ('Your comment was successfully added!')
end

end
