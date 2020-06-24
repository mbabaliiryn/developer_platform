module ProjectsHelper
  def total_project_time(project)
    total = 0
    project.groups.includes([:tasks]).each do |group|
      group.tasks.each { |task| total += task.amount }
    end
    total
  end

  def no_project(list)
    render 'projects/noproject' if list.empty? || list.size == 1
  end
end
