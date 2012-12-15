class UsersController < ApplicationController
  before_filter :logged_in?
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def venues
    @user = User.find(params[:id])
    @venues = @user.venues
    @hide_form = true
    @title = "Venues by #{@user.nickname}"
    render :template => '/venues/index'
  end
end
