class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    if params[:user][:profile_type] == 'Manager'
      @user.profile = Manager.create

    elsif params[:user][:profile_type] == 'Developer'
      @user.profile = Developer.create

    end
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render 'devise/registrations/new'
    end
  end
end
