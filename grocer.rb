require 'pry'
def consolidate_cart(cart)
  final = {}
  cart.each{|item|
  item.each{|name, info|
  if final[name] == nil 
    final[name] = info 
    final[name][:count] = 1
  else 
    final[name][:count] += 1 
  end 
  }
  }
  final
end

def apply_coupons(cart, coupons)
  final={}
  cart.each{|food, info|
  coupons.each{|coupon|
  if food == coupon[:item] && info[:count] >= coupon[:num]
    info[:count] = info[:count] - coupon[:num]
    if final["#{food} W/COUPON"]
      final["#{food} W/COUPON"][:count] += 1 
      binding.pry
    else 
      final["#{food} W/COUPON"] = {:price => coupon[:cost], :clearance => info[:clearance], :count => 1}
    end 
  end 
  }
  final[food] = info
  }
  final
end

def apply_clearance(cart)
  cart.each{|food, info|
  if info[:clearance]
    info[:price] = (info[:price] * 0.8).round(2)
  end 
  }
  cart
end

def checkout(cart, coupons)
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  total = 0
  cart.each do |itemname, data|
    total += ( data[:price] * data[:count] )
  end
  if total > 100
    puts total
    total = total - (total * 0.1 )
    #total.round(2)
  end
  total
end

