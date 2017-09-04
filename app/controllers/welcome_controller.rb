class WelcomeController < ApplicationController
  #Actions
  before_action :authenticate_user!
  def index

  end
end
