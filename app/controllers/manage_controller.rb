class ManageController < ApplicationController
  
  layout "tutorial_listing"
  
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  def index
  end

  def login
  end
  
  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = Admin.where(:username => params[:username]).first
      if found_user
        authorised_user = found_user.authenticate(params[:password])
      end
    end
    if authorised_user
      session[:user_id] = authorised_user.id
      session[:username] = authorised_user.username
      flash[:notice] = "Successfully logged in."
      redirect_to(:controller => 'manage')
    else
      flash[:notice] = "Invalid username and/or password."
      redirect_to :controller => 'manage', :action => 'login'
    end
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out."
    redirect_to :controller => 'manage', :action => 'login'
  end
  
end
