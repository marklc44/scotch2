class RegionsController < ApplicationController

  before_action :render_layout_if_html

  respond_to :json

  def index
    respond_with Region.all
  end

  def show
    respond_with Region.find_by_id(params[:id]).whiskies.to_json(:include =>[:region, :producer])
  end

  private

  def render_layout_if_html
    if request.format.symbol == :html
      render "layouts/application"
    end
  end
end
