class GroupData
  include Capybara::DSL
  def visit_page(path)
    visit(path)
    self
  end

  def submit
    fill_in('group[name]', with: 'Ruby')
    click_on('submit')
    self
  end
end
