module ApplicationHelper
    def tos_global_id(arr)
        arr[1].to_global_id
      end
    
      def user_signed_in
        render 'layouts/signedin' if user_signed_in?
      end
    
      def user_not_signed_in
        render 'layouts/notsignedin' unless user_signed_in?
      end
    
      def total_time_tasks(user, external = false)
        arr = []
    
        if external == true
          user.external_tasks(user.tasks).each { |t| arr << t.amount }
        else
          user.tasks.each { |t| arr << t.amount }
        end
        arr.sum
      end


      def username
        current_user.username if user_signed_in?
      end
        
      def restrict_header
        if user_signed_in?
          unless current_page?(user_path(current_user)) || current_page?(groups_path) || current_page?(projects_path)
            render 'layouts/header'
          end
        else
          render 'layouts/header'
        end
      end
    
      def header_two(title)
        render 'layouts/header_two', title: title if current_page?(groups_path) || current_page?(projects_path)
      end
    
      def notice_alerts
        render 'notice/alerts' if user_signed_in?
      end
    
      def user_image(user)
        if user.image.attached?
          image_tag user.image, class: 'user-show-image text-center mt-5'
        else
          ''
        end
      end
    
      def user_image_small(user)
        if user.image.attached?
          image_tag user.image, class: 'user-show-small text-center mr-3 d-flex'
        else
          ''
        end
      end
    
      def manage_developer(user)
        if user.profile_type == 'Manager'
          # render 'users/manager'
        else
          ''
        end
      end
    
      def working_period(user)
        hiring_date = (Time.now - user.created_at).to_s.to_i
        user.format_duration(hiring_date)
      end
    
      def hidden_user(user)
        if user != current_user
          render 'tasks/taskemp'
        elsif user == current_user
          render 'tasks/taskuser'
        end
      end
    
      def assigned_tasks(user)
        temp = check_tasks_to_do(current_user) if current_user.profile_type == 'Employee' && user == current_user
        if temp == true
          future_tasks = user.tasks.select { |x| x.status == false }
          @future_count = future_tasks.count
          render 'tasks/assignedtasks'
        elsif current_user.profile_type == 'Manager' && current_user != user
          render 'tasks/manager'
        end
      end
    
      def project_all(user = nil)
        user = User.first if user.nil?
        Project.create(name: 'None', user: user) unless Project.find_by(name: 'None')
        Project.all
      end
    
      def check_tasks_to_do(user)
        temp = false
        user.tasks.each do |item|
          next unless item.status == false
    
          temp = true
          break
        end
        return true if temp == true
        return false if temp == false
      end
    
      def layout_header
        render 'layouts/header' unless request.url.include?('users' + '/' + current_user.id.to_s)
      end
end
