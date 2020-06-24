module GroupsHelper
  def total_group_time(groups)
    total = 0
    groups.each { |task| total += task.amount }
    total
  end

  def no_group(list)
    render 'groups/nogroups' if list.empty? || list.size == 1
  end

  def group_icon(task)
    if task.group.nil?
      ''
    else
      fa_icon task.group.icon, class: 'd-flex mr-3 f-s-5'
    end
  end

  def chose_group_icon(icon)
    fa_icon icon, class: 'f-s-3'
  end

  def group_all(user = nil)
    user = User.first if user.nil?
    Group.create(name: 'None', icon: '', user: user) unless Group.find_by(name: 'None')
    Group.all
  end
end
