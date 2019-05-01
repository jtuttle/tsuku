# tsuku
A tweening tool written in Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tsuku'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tsuku

## Usage

First, create a `Tween` object. In this example, we tween the `x` and `y`
properties of the player object over a span of 3000 milliseconds.

```ruby
@tween = Tsuku::Tween.new(player, { x: 10, y: 5 }, 3000)
@tween.start
```

Now in your game update loop, advance the tween by calling its `step` method.
You will need to provide the number of milliseconds that have elapsed since the
previous frame:

```ruby
@tween.step(delta_ms)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/jtuttle/tsuku.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
