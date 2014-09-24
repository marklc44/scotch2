class FlavorProfilesController < ApplicationController

  before_action :render_layout_if_html

  respond_to :json

  def index
  end

  def show
    respond_with Producer.find_by_id(params[:id])
  end

  def render_layout_if_html
    if request.format.symbol == :html
      render "layouts/application"
    end
  end
end
