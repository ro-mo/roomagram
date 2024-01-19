class ProfilesController < ApplicationController
  skip_before_action :authenticate, only: %i[ show ]
  before_action :set_user

  # GET /profiles/1 or /profiles/1.json
  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
