# 
# Farkle game for two players, written in Ruby
#                by Jan Milosh
#
# --------------------------------------
# Player class for creating game players
# Initial scores are set to zero
# The player's turn is initially false
# --------------------------------------
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
		"Enter dice numbers to score or 'b' to bank."
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
#	--------------------------------------------------------
# Method to complete a round and calculate score for round
# --------------------------------------------------------
def round
	play = "playing"
	round_score = 0
	number_of_dice = 6
	while play != "b"																														# to bank your score
		roll_dice(number_of_dice)
		puts prompt(false)
		play = gets.chomp.downcase																								# get the input ('b'ank or die numbers)
		if play != "b"																														# if you're not banking your score
			score_array = play.split('').map { |x| x.to_i }  												# convert input to an array of integers
			remaining_array = @die - score_array
			score_count_array = score_array.group_by{|i| i}.map{|k,v| [k,v.count]}  # count the quantity of each number
			score_hash = Hash[*score_count_array.flatten]														# convert to flattened hash
			number_of_dice = @die.length - score_array.length
			if number_of_dice == 0
				number_of_dice = 6
			end
			6.times do |i|
				p score_hash[i + 1]
			end
		end
	end
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
#	--------------------------------
# Prompt player1 to start the game
# --------------------------------
puts prompt(true)
player1.turn = true
start_play = gets.chomp
round

puts player1.turn

