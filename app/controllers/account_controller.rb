class AccountController < ApplicationController
  before_filter :logged_in?
  def index
    @user = current_user
  end

  def update
    respond_to do |format|
      if current_user.update_attributes(params[:user])
        format.html { redirect_to account_path, notice: 'Account successfully updated.' }
      else
        format.html { render action: "index" }
      end
    end

  end
end
