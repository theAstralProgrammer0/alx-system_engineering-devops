#!/usr/bin/env ruby
matches = ARGV[0].scan(/(?:from:|to:|flags:)(.*?)\]/)

puts matches.join(separator = ",")
