require 'rails_helper'
require_relative '../support/project_form'
require_relative '../support/signup_form'

feature 'Create a new group' do
  let(:user) { User.new(name: 'joe', email: 'joe1@gmail.com', password: 'irene123', password_confirmation: 'irene123') }
  let(:project) { Project.new }
  let(:project_data) { ProjectData.new }
  let(:sign_up) { SignupForm.new }

  before(:each) do
    sign_up.visit_page.sign_up(user)
  end
  scenario 'Authenticated user creates groups' do
    project_data.visit_page(new_project_path).submit
    expect(page.current_path).to eq('/projects/1')
  end
end
