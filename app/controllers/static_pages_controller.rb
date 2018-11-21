class StaticPagesController < ApplicationController
  before_action :store_recent_products, :recently_viewed_products, only: :home

  def home
    @categories = Category.parent_id_null_order_by_id
                          .includes :sub_categories
  end
end
