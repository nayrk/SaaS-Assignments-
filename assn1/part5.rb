#!/usr/bin/env ruby

class Class
	def attr_accessor_with_history(*attr_name)
		attr_name = attr_name.collect { |x| x.to_s }
		attr_name.each do |x|
			attr_reader x # create the attribute's getter
			attr_reader x+"_history" # create bar_history getter
		end

		class_eval do
			attr_name.each do |var|
				define_method( var+"=" ) do |val|
					instance_variable_set("@#{var}",val)
					instance_variable_set("@#{var}_history",[nil]) if instance_variable_get("@#{var}_history").nil?
					instance_variable_get("@#{var}_history") << val
				end
			end
		end
	end
end

class Foo
	attr_accessor_with_history :bar, :foo
end
