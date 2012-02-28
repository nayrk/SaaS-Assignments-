#!/usr/bin/env ruby

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

class String
	# Function to return the rules of RPS game
	def beats?(x)
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
# Returns an array of the matches
def play(subgame)
	subgame.inject([]) do |arr,match|
		r = match[0][1].beats?(match[1][1])
		case r
			when 1
				( arr ||= [] ) << match[0]
			when 0
				( arr ||= [] ) << match[1]
		end
	end
end

# Simulator for the RPS game and returns winner
def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length <= 2

	# Horrible brute force solution, will fix another time
	if game.flatten.size == 4
		g = []
		g << game
		return play(g).flatten
	end
	while game.flatten.size != 2
		g = []
		g << game.inject([]) do |arr,subgame|
			arr << play(subgame)
		end
		game = g
	end
	game.flatten
end
