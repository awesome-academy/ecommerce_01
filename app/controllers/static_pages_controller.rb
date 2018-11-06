class StaticPagesController < ApplicationController
  before_action :store_recent_products, :recently_viewed_products, only: :home

  def home; end
end
