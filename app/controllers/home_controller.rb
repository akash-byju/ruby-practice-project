class HomeController < ApplicationController
  # layout false
  before_action :authenticate_user!
  def index
    # redirect_to(:controller=>'projects',:action=>'index')
  end
end
