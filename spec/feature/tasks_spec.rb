require 'rails_helper'
require_relative '../support/tasks_form'
require_relative '../support/signup_form'

feature 'Create a new task' do
  let(:user) { User.new(name: 'joe', email: 'joe1@gmail.com', password: 'irene123', password_confirmation: 'irene123') }
  let(:task) { Task.new }
  let(:task_data) { TaskData.new }
  let(:sign_up) { SignupForm.new }

  before(:each) do
    sign_up.visit_page.sign_up(user)
  end
  scenario 'Authenticated user creates tasks' do
    task_data.visit_page(new_task_path).submit
    expect(page.current_path).to eq('/groups/1')
  end
end
