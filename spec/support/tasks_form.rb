class TaskData
  include Capybara::DSL
  def visit_page(path)
    visit(path)
    self
  end

  def submit
    fill_in('task[name]', with: 'Ruby')
    fill_in('task[minutes]', with: '23')
    fill_in('task[hours]', with: '20')

    click_on('submit')
    self
  end
end
