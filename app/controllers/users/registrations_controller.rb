class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    if params[:user][:profile_type] == 'Manager'
      @user.profile = Manager.create
      # @employee = Employee.new
      # @employee.function = params[:profile][:employee]
      # @employee.save
      # @user.profile = @employee
    elsif params[:user][:profile_type] == 'Developer'
      @user.profile = Developer.create
      # @manager = Manager.new
      # @manager.function = params[:profile][:manager]
      # @manager.save
      # @user.profile = @manager
    end
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render 'devise/registrations/new'
    end
    # if !params[:profile][:developer].nil?
    #   @developer = developer.new
    #   @developer.function = params[:profile][:developer]
    #   @developer.save
    #   @user.profile = @developer
    # elsif params[:profile][:manager]
    #   @manager = Manager.new
    #   @manager.function = params[:profile][:manager]
    #   @manager.save
    #   @user.profile = @manager
    # end
    # if @user.save
    #   sign_in @user
    #   redirect_to root_path
    # else
    #   render 'devise/registrations/new'
    # end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(employee: { function: [] })
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
