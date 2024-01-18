class HomeController < ApplicationController
  skip_before_action :authenticate, only: %i[ index ]
  def index
    @categories = Room.distinct.pluck(:category)
    @rooms = Room.all

    if params[:q].present?
      @rooms = @rooms.where('name LIKE ?', "%#{params[:q]}%")
    end
    if params[:category].present?
      @rooms = @rooms.where(category: params[:category])
    end
  end
end
