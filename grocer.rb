def consolidate_cart(cart:[])
  # code here	  consolidated_cart = {}

   cart.each do |item|
    item_name = item.keys[0]

     consolidated_cart[item_name] = item.values[0]

     if consolidated_cart[item_name][:count] 
      consolidated_cart[item_name][:count] += 1
    else
      consolidated_cart[item_name][:count] = 1
    end
  end

   consolidated_cart
end

