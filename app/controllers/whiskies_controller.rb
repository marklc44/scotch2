class WhiskiesController < ApplicationController

  before_action :render_layout_if_html

  respond_to :json, :html

  def index
    respond_with Whisky.find_by_producer_id(params[:producer_id])
  end

  def show
    respond_with Whisky.find_by_id(params[:id])
  end
end
