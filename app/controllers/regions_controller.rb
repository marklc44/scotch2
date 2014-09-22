class RegionsController < ApplicationController

  before_action :render_layout_if_html

  respond_to :json
  # serve all regions json
  def index
    respond_with Region.all
  end

  def show
  end
end
