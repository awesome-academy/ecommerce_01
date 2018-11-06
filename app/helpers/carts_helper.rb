module CartsHelper

  private

  def order_item_total order_item
    @product[0].price * order_item["quantity"].to_i
  end

  def load_product_details products, id
    @product = products.select {|item| item.id == id}
  end

  def render_404
    respond_to do |format|
      format.html do
        render file: "#{Rails.root}/public/404", layout: true,
          status: :not_found
      end
      format.xml{head :not_found}
      format.any{head :not_found}
    end
  end
end
