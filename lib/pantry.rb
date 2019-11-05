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
    # @stock.reduce({}) do |stocked, amount|
    #   if stocked[ingredient] = 0
    #     stocked[ingredient] += amount
    #   else
    #     stocked[ingredient] = amount
    #   end
    #   stocked
    # end
    if stock_check(ingredient)
      @stock[ingredient] += amount
    end
  end
end
