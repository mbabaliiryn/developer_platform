require 'rails_helper'
require_relative '../support/groups_form'
require_relative '../support/signup_form'

feature 'Create a new group' do
  let(:user) { User.new(name: 'joe', email: 'joe1@gmail.com', password: 'irene123', password_confirmation: 'irene123') }
  let(:group) { Group.new }
  let(:group_data) { GroupData.new }
  let(:sign_up) { SignupForm.new }

  before(:each) do
    sign_up.visit_page.sign_up(user)
  end
  scenario 'Authenticated user creates groups' do
    group_data.visit_page(new_group_path).submit
    expect(page.current_path).to eq('/groups')
  end
end
