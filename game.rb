# 
# Farkle game for to players, written in Ruby
# by Jan Milosh
#
# --------------------------------------------------------------
# Player class for creating game players
# Initial scores are set to zero
# The player's turn is initially false
# --------------------------------------------------------------
class Player
	attr_reader :name
	attr_accessor :score
	attr_accessor :turn	
	def initialize(name)
		@name = name
		@score = 0
		@turn = false
	end
end
# -------------------------------------------
# Method to prompt the player to roll or bank
# -------------------------------------------
def prompt(first_roll = false)
	if first_roll == true
		"Hit the enter key to roll your dice."
	else
		"Enter dice numbers to score or enter to bank."
	end
end
# -----------------------------------------------
# Method to roll dice and draw output in terminal
# -----------------------------------------------
def roll_dice(n = 6)
	@die = [n]
	@roll_total = 0
	n.times do |i|
		@die[i] = rand(6) + 1
		@roll_total = @roll_total + @die[i]
	end
	puts
	n.times do |i|
		case @die[i]
			when 1
				print "|   | "	
			when 2
				print "|*  | "				
			when 3
				print "|*  | "			
			when 4
				print "|* *| "				
			when 5
				print "|* *| "				
			when 6
				print "|* *| "				
		end			
	end
	puts
	n.times do |i|
			case @die[i]
				when 1
					print "| * | "	
				when 2
					print "|   | "				
				when 3
					print "| * | "			
				when 4
					print "|   | "				
				when 5
					print "| * | "				
				when 6
					print "|* *| "				
			end			
		end
	puts
	n.times do |i|
			case @die[i]
				when 1
					print "|   | "	
				when 2
					print "|  *| "				
				when 3
					print "|  *| "			
				when 4
					print "|* *| "				
				when 5
					print "|* *| "				
				when 6
					print "|* *| "				
			end			
		end
	puts
	n.times do |i|
		print "  #{@die[i]}   "
	end
	puts

end

#	----------------------------------
# Prompt the players for their names
# ----------------------------------
puts "player one: What's your name?"
player1 = Player.new(gets.chomp)
puts "player two: What's your name?"
player2 = Player.new(gets.chomp)	
puts "________________________________________________"
puts
puts "Welcome to Farkle #{player1.name} and #{player2.name}!"
puts "The game begins with #{player1.name} rolling first."
puts "________________________________________________"
puts prompt(true)
start_roll = gets.chomp
roll_dice(start_roll.to_i)

puts player1.turn
puts prompt(false)
start_roll = gets.chomp
roll_dice(start_roll.to_i)

