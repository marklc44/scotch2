class ProducersController < ApplicationController

  before_action :render_layout_if_html

  respond_to :json, :html

  def index
  end

  def show
    respond_with Producer.find_by_id(params[:id]).to_json(:include => [:region, :whiskies])
  end

  private
  def render_layout_if_html
    if request.format.symbol == :html
      render "layouts/application"
    end
  end
end
