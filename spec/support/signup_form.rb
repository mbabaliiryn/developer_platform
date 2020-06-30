class SignupForm
  include Capybara::DSL
  def visit_page
    visit('/users/sign_up')
    self
  end

  def sign_up(user)
    fill_in 'user[name]',	with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    click_on('register')
    self
  end
end
