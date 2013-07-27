class VendingMachine
  attr_reader :total, :change, :stock, :sale_amount

  def initialize
    @total = 0
    @change = 0
    @stock = {coke: {price: 120, amount: 5}}
    @sale_amount = 0
  end

  def add n
    if is_valid_money n
      @total += n
    else
      @change += n
    end
  end

  def is_valid_money n
    [10, 50, 100, 500, 1000].include?(n)
  end

  def payback
    @change += @total
    @total = 0
    @change
  end
  
  def purchase drink
    if @stock[drink][:price] <= @total
      @stock[drink][:amount] -= 1
      @sale_amount += @stock[drink][:price]
      @total -= @stock[drink][:price]
    end
  end
end
