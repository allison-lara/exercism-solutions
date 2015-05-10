class Squares
  def initialize(num)
    @range = (1..num)
  end

  def square_of_sums
    @range.reduce(:+) ** 2
  end

  def sum_of_squares
    @range.reduce {|s,n| s + n ** 2 }
  end

  def difference
    square_of_sums - sum_of_squares
  end
end
