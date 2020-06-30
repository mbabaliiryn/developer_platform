class ProjectData
  include Capybara::DSL
  def visit_page(path)
    visit(path)
    self
  end

  def submit
    fill_in('project[name]', with: 'Ruby')
    click_on('submit')
    self
  end
end
