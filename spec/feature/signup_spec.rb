require 'rails_helper'
require_relative '../support/signup_form'

feature 'Signup Page' do
  let(:user) { User.new(name: 'joe', email: 'joe1@gmail.com', password: 'irene123', password_confirmation: 'irene123') }
  let(:user2) { User.new(name: 'pato') }
  let(:signup) { SignupForm.new }
  scenario 'Redirect to  page on success signup' do
    signup.visit_page.sign_up(user)
    expect(page.current_path).to eq('/users/1')
  end

  scenario 'Remain on User path on failed signup' do
    signup.visit_page.sign_up(user2)
    expect(page.current_path).to eq('/users')
  end
end
