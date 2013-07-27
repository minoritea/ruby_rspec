class VendingMachine
  attr_reader :total
  def initialize
    @total = 0
  end
  def add_10
    @total += 10
  end
end