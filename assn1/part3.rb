#!/usr/bin/env ruby

def combine_anagrams(words)
	words.inject([]) do |arr,word|
		arr << words.select { |x| x.split(//).sort.join("").downcase == word.split(//).sort.join("").downcase }
	end.uniq
end
