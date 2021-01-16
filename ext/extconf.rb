#!/usr/bin/env ruby
require 'mkmf'
$CFLAGS << " -Wall -Ofast"

create_makefile 'levenshtein'
