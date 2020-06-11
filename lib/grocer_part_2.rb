require_relative './part_1_solution.rb'
require "pry"

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  # Loop through each coupon in coupons array
  coupons.each do |coupon|
    
    # Create a variable to store the coupon item
    coupon_item = find_item_by_name_in_collection(coupon[:item], cart)
    
    # Create a variable that tells us if the coupon item exists in the cart, set to boolean value of coupon_item (if find_item_in_cart function results to nil, then coupon_item_is_in_cart will be false)
    coupon_item_is_in_cart = !!coupon_item
    
    # If the coupon item is in the cart and we have enough of the items to use the coupon, then push the new hash into cart
    if coupon_item_is_in_cart && coupon_item[:count] >= coupon[:num]
      
      discounted_item_hash = {}
      discounted_item_hash[:item] = coupon_item[:item] + " W/COUPON"
      discounted_item_hash[:price] = coupon[:cost] / coupon[:num]
      discounted_item_hash[:clearance] = coupon_item[:clearance]
      discounted_item_hash[:count] = coupon[:num]
      
      cart << discounted_item_hash
      
      # Update the cart's item
      coupon_item[:count] -= coupon[:num]
    end
  end
  
  # Return cart
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
