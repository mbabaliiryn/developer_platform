class ManagersController < ApplicationController
  def developers
    @developers_list = Developer.all
    @developers = user_developer(@developers_list)
  end

  private

  def user_developer(list)
    a = list.map { |x| User.find_by(profile: x) }
    a.select { |x| x }
  end
end
