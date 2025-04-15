class UsersController < ApplicationController
    before_action :authenticate_user!
    include Pundit::Authorization
  
    def index
      authorize User
      @users = policy_scope(User)
    end
  
    def show
      @user = User.find(params[:id])
      authorize @user
    end
  end
  