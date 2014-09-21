class WhiskiesController < ApplicationController

  before_action :render_layout_if_html

  respond_to :json

  def index
    if params[:producer_id]
      respond_with Whisky.find_by_producer_id(params[:producer_id])
    else
      respond_with Whisky.all
    end
  end

  def show
    respond_with Whisky.find_by_id(params[:id])
  end
end
