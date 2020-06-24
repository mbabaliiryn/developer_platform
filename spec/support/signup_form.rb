class SignupForm
  include Capybara::DSL
  def visit_page
    visit('/users/new')
    self
  end

  def register(user)
    fill_in 'name',	with: user.username
    fill_in 'email', with: user.email
    fill_in 'password',	with: user.password
    fill_in 'password_confirmation',	with: user.password_confirmation
    click_on('Sign up')
    self
  end
end
