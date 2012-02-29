#!/usr/bin/env ruby

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

class String
	# Function to return the rules of RPS game
	def beats?(x)
		# Raise error if no such strategy
		raise NoSuchStrategyError if x =~ /[^S|P|R]/
		
		# First player wins if its a tie
		return 1 if self == x

		case self
			when "R"
				return 1 if x == "S"
			when "S"
				return 1 if x == "P"
			when "P"
				return 1 if x == "R"
			else
				raise NoSuchStrategyError
		end
		return 0
	end
end

# Allows each pair to play a match
# It recursively calls itself until
# it finds a pair to play
# Returns an array of the match winners
def play(subgame)
	subgame.inject([]) do |arr,match|
		if !match[0][1].respond_to? :beats?
			arr << play(match) 
		else
			r = match[0][1].beats?(match[1][1])
			case r
				when 1
					( arr ||= [] ) << match[0]
				when 0
					( arr ||= [] ) << match[1]
			end
		end
	end
end

# Simulator for the RPS game and returns winner
def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2

	# Single match
	if game.flatten.size == 4
		# Reformat the array to work with play()
		game = Array.new(1) { Array.new(1) {game}  }
	end

	# Multiple matches
	while game.flatten.size != 2
		# Reformat the array to work with play()
		g = []
		g << game.inject([]) do |arr,subgame|
			arr << play(subgame)
		end
		game = g
	end
	game.flatten
end

# Function simply calls rps_game_winner(game) because
# rps_game_winner can handle all the cases
def rps_tournament_winner(game)
	rps_game_winner(game)	
end
