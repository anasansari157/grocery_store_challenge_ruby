# Item Class
class Item
  attr_accessor :item, :quantity, :price

  def initialize (item, quantity)
    @item = item
    @quantity = quantity
    @price = calculate_price
  end

  def calculate_price
    milk_sale_unit_price = 2.50
    milk_unit_price = 3.97

    bread_sale_unit_price = 2.00
    bread_unit_price = 2.17
    
    apple_unit_price = 0.89
    
    banana_unit_price = 0.99

    discount_on_pair_of = 0

    case @item
    when "milk"
      discount_on_pair_of = 2

      $total_price_pre_discount_for_all_items_combined += (@quantity * milk_unit_price)

      milk_price = generate_price_after_sale_discount(discount_on_pair_of, milk_sale_unit_price, milk_unit_price)
      return milk_price

    when "bread"
      discount_on_pair_of = 3

      $total_price_pre_discount_for_all_items_combined += (@quantity * bread_unit_price)

      bread_price = generate_price_after_sale_discount(discount_on_pair_of, bread_sale_unit_price, bread_unit_price) 
      return bread_price

    when "apple"
      $total_price_pre_discount_for_all_items_combined += (@quantity * apple_unit_price)

      return apple_unit_price
    when "banana"
      $total_price_pre_discount_for_all_items_combined += (@quantity * banana_unit_price)
      
      return banana_unit_price
    end
  end

end


# Main
def run_test 
  bill = []
  puts "Please enter all the items purchased separated by a comma"
  list_by_user = gets.chomp().gsub(/\s+/, "").split(",")

  if list_by_user.include? "milk"
    createItem "milk", list_by_user, bill
  end
  
  if list_by_user.include? "bread"
    createItem "bread", list_by_user, bill
  end
  
  if list_by_user.include? "apple"
    createItem "apple", list_by_user, bill
  end
  
  if list_by_user.include? "banana"
    createItem "banana", list_by_user, bill
  end
end


# Create Item
def createItem item, list, bill
  quantity = list.count(item)
  bill.push(Item.new(item , quantity))
end


