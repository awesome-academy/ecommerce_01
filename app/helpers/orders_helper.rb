module OrdersHelper
  def order_counter counters, order
    counters.find_index(order) + 1
  end
end
