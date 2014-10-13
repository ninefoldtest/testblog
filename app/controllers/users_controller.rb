class UsersController < ApplicationController
  before_filter :check_if_logged_in


  def edit
    @user = @authenticated
    render :edit
  end


  def update
    @user = @authenticated
    if @user.update_attributes params[:user]
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def check_if_logged_in
    redirect_to(root_path) unless @authenticated.present?
  end


end
