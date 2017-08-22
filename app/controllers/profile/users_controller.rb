class Profile::UsersController < ApplicationController

  namespace :profile do
    resources :users
  end

  before_action :set_profile, only: [:edit, :update]

  def profile
    @user = User.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to dashboard_path
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to dasbhoard_path
    else
      render 'new'
    end
  end

  private


  def set_profile
    @profile = Profile.find(params[:id])
  end


end
