require_relative 'roller'
require_relative 'runner_utili'

class Players
  attr_reader :name
  attr_accessor :piece
  def initialize(name)
    @name   = name
    @piece  = piece
  end
end

@players = []
reset_screen!
line
puts "CONNECT FOUR".center(center_it)
line
print "What is player's one name: "
player1 = Players.new(gets.chomp.capitalize)
player1.piece = "X"
print "What is player's two name: "
player2 = Players.new(gets.chomp.capitalize)
player2.piece = "O"
line
puts "Welcome to Connect Four #{player1.name} & #{player2.name}".center(center_it)
line
wait

puts "Lets get started shall we?"
puts "First we need to determine who plays first!"
line
wait
until @players.length == 2

	print "#{player1.name}, roll your dice by hitting return(enter): "
	gets.chomp
	roll_dice(1)
	puts
	puts "#{player1.name} rolled a #{@face_value}"
	p1_roll = @face_value
	
	
	puts
	
	print "#{player2.name}, roll your dice by hitting return(enter): "
	gets.chomp
	roll_dice(1)
	puts
	puts "#{player2.name} rolled a #{@face_value}"
	p2_roll = @face_value
	
	if p1_roll > p2_roll
    puts
		puts "#{player1.name} you will go frist!"
		@players << player1 << player2
	elsif p1_roll < p2_roll
    puts
		puts "#{player2.name} you will go first!"	
		@players << player2 << player1
	else
    puts
		puts "Roll again guys, that was a tie"
    puts
	end
end

# p @players.length

# else p1_roll == p2_roll
# 		puts "OOPPSSS a tie, what do we do now??"
