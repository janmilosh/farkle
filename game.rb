# 
#       Farkle game for two players, written in Ruby
#                     by Jan Milosh
#
# ---------------------------------------------------------
#         Player class for creating game players
#             Initial scores are set to zero
#          The player's turn is initially false
# ---------------------------------------------------------
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
# ---------------------------------------------------------
#        Method to prompt the player to roll or bank
# ---------------------------------------------------------
def prompt(player)
	"#{player} rolled:  \bEnter b to end turn and bank score.\nEnter scoring dice numbers to keep rolling (ex: 1115)."
end
# ---------------------------------------------------------
#      Method to roll dice and draw output in terminal
# ---------------------------------------------------------
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
# ---------------------------------------------------------
#                Method to complete a round
# ---------------------------------------------------------
def round(player)
	input = "playing"
	round_score = 0
	number_of_dice = 6
	begin																														# to bank your score
		roll_dice(number_of_dice)
		puts prompt(player)
		input = gets.chomp.downcase																								# get the input ('b'ank or die numbers)																														# if you're not banking your score
		score_array = input.split('').map { |x| x.to_i } 												# convert input to an array of integers
		remaining_array = @die - score_array
		score_count_array = score_array.group_by{|i| i}.map{|k,v| [k,v.count]}  # count the quantity of each number
		score_hash = Hash[*score_count_array.flatten]														# convert to flattened hash
		number_of_dice = @die.length - score_array.length
		roll_score = get_score(score_hash)
		if roll_score == 0
			round_score = 0
			puts "You just Farkled and lost your points from this round."
			break
		else
			round_score = round_score + roll_score
		end
		puts "Score for this roll: #{roll_score}"
		puts "Score so far this round: #{round_score}"
		puts "________________________________________________"
		if number_of_dice == 0 && input != "b"
			number_of_dice = 6
			puts "You have hot dice!!!"
		end
	end while input != "b"
	return round_score
end
# ---------------------------------------------------------
#        Method to calculate the score for a round
# ---------------------------------------------------------
def get_score(score_hash)
	6.times do |i|
		if score_hash[i + 1] == nil
			score_hash[i + 1] = 0
		end
	end
	roll_score = 0
	if score_hash[1] >= 3
		roll_score = roll_score + 1000
	end
	5.times do |i|
		if score_hash[i + 2] >= 3
			roll_score = roll_score + 100 * (i + 2)
		end			
	end
	roll_score = roll_score + score_hash[1]%3 * 100
	roll_score = roll_score + score_hash[5]%3 * 50
end
# ---------------------------------------------------------
#       Start by prompting the players for their names
# ---------------------------------------------------------
puts "Player one: What's your name?"
player1 = Player.new(gets.chomp)
puts "Player two: What's your name?"
player2 = Player.new(gets.chomp)	
puts "________________________________________________"
puts
puts "Welcome to Farkle #{player1.name} and #{player2.name}!"
puts "The game begins with #{player1.name} rolling first."
puts "________________________________________________"
# ---------------------------------------------------------
#          Play game method, start with player1
# ---------------------------------------------------------
player1.turn = true
player = player1.name
begin 
	puts "#{player1.name}: #{player1.score} points   #{player2.name}: #{player2.score} points"
	round_score = round(player)
	puts "This is the round score #{round_score} for #{player}."
	if player1.turn == true
		player1.turn = false
		player2.turn = true
		player = player2.name
		player1.score = player1.score + round_score
	else
		player1.turn = true
		player2.turn = false
		player = player1.name
		player2.score = player2.score + round_score
	end
	puts "Hit return to continue or q to quit."
	quit = gets.chomp
	if quit == "q"
		exit
	end
end while player1.score < 10000 && player2.score < 10000
if player1.score > player2.score
	puts "#{player1.name} wins!!!"
elsif player2.score > player1.score
	puts "#{player2.name} wins!!!"
else
	puts "It's a tie!!!"
end




