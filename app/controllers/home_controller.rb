class HomeController < ApplicationController
  skip_before_action :authenticate, only: %i[ index ]
  def index
    @rooms = Room.all
  end
end
