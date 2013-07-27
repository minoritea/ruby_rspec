class VendingMachine
  attr_reader :total
  def initialize
    @total = 0
  end
  def add n
    @total += n
  end
  def payback
    change = @total
    @total = 0
    change
  end
end