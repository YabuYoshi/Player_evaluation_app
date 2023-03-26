class ApplicationController < ActionController::Base
  before_action :authenticate_admin_and_user!, except: [:top]
  #before_action :authenticate_user!, except: [:top]
  private
  def authenticate_admin_and_user!
    if admin_signed_in?
      true
    else
      authenticate_user!
    end
  end
end
