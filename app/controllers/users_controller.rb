class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    
    if has_roles?(user_params)
      # Change user roles
      @user.roles.each do |r|
        name = r.name
        id = r.id
        @user.remove_role r.name
        Role.find_or_create_by(id: id, name: name)
      end
      if user_params[:role_ids].is_a? String
          new_role = Role.find_by(id: user_params[:role_ids])
          @user.add_role new_role.name
      else
        user_params[:role_ids].each do |r|
          new_role = Role.find_by(id: r)
          @user.add_role new_role.name
        end
      end
      redirect_to users_path
    else
      if @user.update_attributes(params[:user], :as => :admin)
        redirect_to users_path, :notice => "User updated."
      else
        redirect_to users_path, :alert => "Unable to update user."
      end
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = @user
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  private
    def set_user
      @user = User.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :role_ids, :password, :password_confirmation, 
        :current_password, :unlock)
    end

    def has_roles?(params)
      params[:role_ids].present?
    end
end