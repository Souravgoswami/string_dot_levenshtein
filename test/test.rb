#!/usr/bin/env ruby
$-v = true

begin
	require 'string_dot_levenshtein'
rescue LoadError
	abort "Make sure string_dot_levenshtein is installed on your system before testing"
end

words = IO.readlines(File.join(__dir__, 'words')).each(&:strip!)
matches, i = {}, -1

puts "Test started at #{Time.now}, please wait a moment... | Word length: #{words.length}"

time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
while x = words[i += 1]
	m = []
	j = -1
	while y = words[j += 1]
		m << y if x.levenshtein(y) < 2
	end

	matches.merge!(x => m)
end
time_diff = Process.clock_gettime(Process::CLOCK_MONOTONIC) - time

puts matches, "\nWords: #{words.length} "\
"| Matches: #{matches.values.map(&:length).sum} "\
"| Time taken: #{time_diff}s"
