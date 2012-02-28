#!/usr/bin/env ruby

def palindrome?(string)
	string = string.gsub(/[^\w]/,'').downcase
	return true if string == string.reverse
end

def count_words(string)
	string.gsub(/[^A-Za-z\s]/,'').downcase.split(/\s+/)\
	.inject(Hash.new(0)) do |hash,word|
		hash[word] += 1
		hash
	end
end
