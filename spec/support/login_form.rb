class LoginForm
  include Capybara::DSL

  def visit_page
    visit('/users/sign_in')
    self
  end

  def login_as
    fill_in('user', with: 'pato')
    fill_in('email', with: 'pato@gmail.com')
    click_on('Log in')
    self
  end
end
