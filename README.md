# StringDotLevenshtein

![Preview](https://github.com/Souravgoswami/string_dot_levenshtein/blob/master/preview/preview.webp)

Levenstein algorithm helps calculate the distance between two words.
You can make a spell checker using this algorithm.

This gem attempts to solve this as fast as possible but at the expense of disallowing big string and non ASCII characters.
Any string more than 4096 characters will raise RuntimeError.

You can also use the pure Ruby method as a workaround, which doesn't have any limitation, but it's way slower.

Read the usage for more info.

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

Once you are done, and you can compile the C file, you can follow the installation!

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
### String#levenshtein(str)

To get word rank, just use `String#levenshtein(str)`. For example:

```
irb(main):001:0> require 'string_dot_levenshtein'
=> true
irb(main):002:0> "sunday".levenshtein("saturday")
=> 3
```

Cons:
+ The length of the string is limited to 4096 characters.
+ Any non-ASCII character can return an incorrect result.

Pros:
+ It's the fastest.

### String#levenshtein_rb(str)

To overcome the cons led by using `String#levenshtein(str)`, use `String#levenshtein_rb(str)`:

```
irb(main):001:0> require 'string_dot_levenshtein'
=> true
irb(main):002:0> "sunday".levenshtein_rb("saturday")
=> 3

# This is the C Ruby method
irb(main):003:0> "a".levenshtein("🐻")
=> 4

# This is the pure Ruby method
irb(main):004:0> "a".levenshtein_rb("🐻")
=> 1

# This is the C Ruby method
irb(main):005:0> "cómo".levenshtein("como")
=> 2

# This is the pure Ruby method
irb(main):006:0> "cómo".levenshtein_rb("como")
=> 1

```

Cons:
+ It's 9 - 10x slower than the String#levenstein(arg) as it's written in pure Ruby

Pros:
+ It can work with arbitrary-length string
+ It can work with emojis
+ It can work with various other languages

---

+ Note that words are case-sensitive, unstripped. 3 and 4-byte emojis are counted as 3 and 4-byte string.

+ If you are building an application where the user is guaranteed to use only 1 byte ASCII characters, use the `String#levenshtein(str)` method, it's fast!

+ For supporting various languages and emoji (although they don't calculate the distance), use `String#levenshtein_rb(str)`

---

If you want to search a dictionary against matches, you can get a dictionary.com verified
(scraped) wordlist here: https://github.com/Souravgoswami/wordlists/blob/master/dictionary.com_verified_words

## Development

After checking out the repo, run `bin/setup` to install dependencies.
To install this gem onto your local machine, run `rake install`.

## Contributing

Our main aim is to make the calculation as fast as possible without losing any accuracy.
This is a small gem, we don't care a bit about code-readability and maintainability.
So any suggestion or contribution that makes the gem faster are greatly welcomed.

Bug reports and pull requests are welcome on GitHub at https://github.com/Souravgoswami/string_dot_levenshtein.

## License

The gem is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
