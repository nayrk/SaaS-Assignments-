#!/usr/bin/env ruby

class Dessert
	attr_accessor :name, :calories

	def initialize(name, calories)
		@name, @calories = name, calories
	end

	def healthy?
		return @calories < 200
	end

	def delicious?
		true
	end
 end

class JellyBean < Dessert
	attr_accessor :flavor

	def initialize(name, calories, flavor)
		@name, @calories, @flavor = name, calories, flavor
	end

	def delicious?
		return @flavor != "black licorice"
	end
end
