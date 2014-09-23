class SitesController < ApplicationController

  # before_action :is_authenticated?
  before_action :render_layout_if_html

  def index
  end

  private

  def render_layout_if_html
    if request.format.symbol == :html
      render "layouts/application"
    end
  end
end
