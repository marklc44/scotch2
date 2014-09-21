class SitesController < ApplicationController

  before_action :is_authenticated?
  before_action :render_layout_if_html

  def index
  end
end
