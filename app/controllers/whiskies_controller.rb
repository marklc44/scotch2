class WhiskiesController < ApplicationController

  before_action :render_layout_if_html

  respond_to :json, :html

  def index

    if params[:producer_id]
      respond_with Whisky.find_by_producer_id(params[:producer_id]).to_json(:include => (:whiskies))
    else
      # respond_with Whisky.all.includes(:producer)
      respond_with Whisky.all.to_json(:include => [:producer, :region])
    end
  end

  def show
    respond_with Whisky.find_by_id(params[:id]).to_json(:include => [:producer, :region])
  end

  private

  def render_layout_if_html
    if request.format.symbol == :html
      render "layouts/application"
    end
  end

end
