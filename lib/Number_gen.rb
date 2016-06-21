class Number_gen
  attr_reader :num_set
  def initialize
    @num_gen = num_gen
  end

  def num_gen
    @num_gen = *(1..100)
    @num_gen.sample
  end
end
