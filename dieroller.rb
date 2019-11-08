class Die
  def initialize(sides)
    @sides = sides
  end

  def roll(number=1)
  roll_array = []
  number.times do
    roll_value = rand(1..@sides)
    puts "You rolled a #{roll_value}!"
    roll_array << roll_value
  end
  total = 0
  roll_array.each do |roll|
    new_total = total + roll
    total = new_total
  end

  total

  end 

end 

d4 = Die.new(4)
d6 = Die.new(6)
d8 = Die.new(8)
d10 = Die.new(10)
d12 = Die.new(12)
d20 = Die.new(20)
d100 = Die.new(100)
