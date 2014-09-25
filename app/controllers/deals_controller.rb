class DealsController < ApplicationController

  before_action :render_layout_if_html

  respond_to :json, :html

  def show
    brand = params[:brand]

    sem3 = Semantics3::Products.new(ENV['sem3_api'], ENV['sem3_secret'])

    sem3.products_field("cat_id", 11481)
    sem3.products_field("brand", brand)
    sem3.products_field("limit", 10)

    respond_with productsHash = sem3.get_products
  end

  def render_layout_if_html
    if request.format.symbol == :html
      render "layouts/application"
    end
  end
end
