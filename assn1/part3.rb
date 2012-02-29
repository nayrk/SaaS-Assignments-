#!/usr/bin/env ruby

def combine_anagrams(words)
	words.inject([]) do |arr,word|
		arr << words.select { |x| x.downcase.split(//).sort.join("") == word.downcase.split(//).sort.join("") }
	end.uniq
end
