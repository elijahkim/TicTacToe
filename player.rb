class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_input name
    name = name
    puts "it is now, player #{name}'s turn" 
    print "x: "
    x = gets.chomp.to_i
    print "y: "
    y = gets.chomp.to_i
    [y,x]
  end
end



