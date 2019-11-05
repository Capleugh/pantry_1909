class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock[ingredient]
      @stock[ingredient]
    else
      @stock[ingredient] = 0
    end
# require "pry"; binding.pry
  end

  def restock(ingredient, amount)
    if stock_check(ingredient)
      @stock[ingredient] += amount
    end
  end

  def enough_ingredients_for?(recipe)
    # require "pry"; binding.pry
    recipe_amount = recipe.ingredients_required.map do |ingredient, amount|
      # require "pry"; binding.pry
         amount <= stock_check(ingredient)

    end

    @stock.find do |ingredient, amount|
    #   # require "pry"; binding.pry
    #   amount >= recipe_amount
    # end
  end
end
