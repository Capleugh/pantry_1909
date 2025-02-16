require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_initialize
    assert_equal ({}), @pantry.stock
  end

  def test_stock_starts_at_zero
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_it_can_restock_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_it_can_whether_it_has_enough_ingredients_for_recipe
    @mac_and_cheese.amount_required(@cheese)
    @mac_and_cheese.amount_required(@mac)
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    @pantry.restock(@mac, 7)

    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 1)
    
    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)

  end
end
