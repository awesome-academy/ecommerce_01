module CartsHelper
  private

  def order_item_total order_item
    @product[0].price * order_item["quantity"].to_i
  end

  def load_product_details products, id
    @product = products.select{|item| item.id == id}
  end

  def show_total_in_cart products, order_items
    products.sum do |product|
      quantity = order_items.select do |item|
        item["product_id"] == product["id"].to_s
      end
      product["price"].to_d * quantity[0]["quantity"].to_i
    end
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
