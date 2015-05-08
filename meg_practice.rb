class Meg
  def initialize
    @range = nil
  end


  def print_a_shit_ton(min, max)
    fill_range(min, max)
    @range.each {|item| puts "tuls"*item }
  end

  def fill_range(min, max)
    @range = (min..max).to_a
  end
  
end


#---- driver code --------#
@meg = Meg.new
@meg.print_a_shit_ton(0, 10)