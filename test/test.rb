#!/usr/bin/env ruby
$-v = true

begin
	require 'string_dot_levenshtein'
rescue LoadError
	abort "Make sure string_dot_levenshtein is installed on your system before testing"
end

words = IO.readlines(File.join(__dir__, 'words')).each(&:strip!).shuffle.first(500)
i = -1

puts "Test started at #{Time.now}, please wait a moment... | Word length: #{words.length}"

time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
while x = words[i += 1]
	j = -1
	while y = words[j += 1]
		_l = x.levenshtein(y)
		_l_rb = x.levenshtein_rb(y)
		raise RuntimeError unless _l == _l_rb
	end
end
time_diff = Process.clock_gettime(Process::CLOCK_MONOTONIC) - time

puts "Time taken: #{time_diff}s"
