class Admin::SessionsController < ApplicationController
  before_action :authenticate_user!

  def dashbord
  end
end
