# StringDotLevenshtein

![Preview](https://github.com/Souravgoswami/string_dot_levenshtein/blob/master/preview/preview.webp)

Levenstein algorithm helps calculate the distance between two words.
You can make a spell checker using this algorithm.

This gem attempts to solve this fast but at the expense of disallowing big string.

Any string more than 4096 characters will raise RuntimeError.

The main focus of this gem is to hunt for big dictionaries, that have short (< 4096 characters)
but hundreds of thousands of words.

Do note that emojis will not work, and it will make it output some weird results, like +4 if the
emoji is 4 bytes, +3 bytes if it's 3 bytes, etc.

## Dependencies (Build)

You need to have the C compiler installed to be able to compile the C extension. On Arch Linux:

```
# pacman -S gcc make
```

On Debian based systems:

```
# apt install gcc build-essential
```

You might also require `ruby-dev` in Debian based systems which provides support for ruby.h header file:

```
# apt install ruby-dev
```

Once your are done, and you can compile the C file, you can follow the installation!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string_dot_levenshtein'
```

And then execute:

```
$ bundle install
```
Or install it yourself as:
```
$ gem install string_dot_levenshtein
```

## Usage

To get word rank, just use String#levenshtein(str).

For example:

```
irb(main):001:0> require 'string_dot_levenshtein'
=> true
irb(main):002:0> "sunday".levenshtein("saturday")
=> 3
```

If you want to search a dictionary against matches, you can get a dictionary.com verified
(scraped) wordlist here:

https://github.com/Souravgoswami/wordlists/blob/master/dictionary.com_verified_words

## Development

After checking out the repo, run `bin/setup` to install dependencies.
To install this gem onto your local machine, run `rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Souravgoswami/string_dot_levenshtein.

## License

The gem is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
