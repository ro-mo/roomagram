class MediaItemsController < ApplicationController
  before_action :set_media_item, only: %i[ show edit update destroy ]

  # GET /media_items or /media_items.json
  def index
    @media_items = MediaItem.all
  end

  # GET /media_items/1 or /media_items/1.json
  def show
  end

  # GET /media_items/new
  def new
    @media_item = MediaItem.new
  end

  # GET /media_items/1/edit
  def edit
  end

  # POST /media_items or /media_items.json
  def create
    @media_item = MediaItem.new(media_item_params)

    respond_to do |format|
      if @media_item.save
        format.html { redirect_to media_item_url(@media_item), notice: "Media item was successfully created." }
        format.json { render :show, status: :created, location: @media_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @media_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media_items/1 or /media_items/1.json
  def update
    respond_to do |format|
      if @media_item.update(media_item_params)
        format.html { redirect_to media_item_url(@media_item), notice: "Media item was successfully updated." }
        format.json { render :show, status: :ok, location: @media_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @media_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_items/1 or /media_items/1.json
  def destroy
    @media_item.destroy!

    respond_to do |format|
      format.html { redirect_to media_items_url, notice: "Media item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_item
      @media_item = MediaItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def media_item_params
      params.require(:media_item).permit(:x, :y, :z, :item, :room_id)
    end
end
