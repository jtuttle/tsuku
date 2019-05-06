# tsuku
A tweening tool written in Ruby

## Installation

Add this line to your application's Gemfile:

```
gem 'tsuku'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tsuku

## Usage

The recommended way to use Tsuku is to interface with the `Tweener` class.
First, make sure to call the `step` method in your main update loop. You will
need to provide the number of milliseconds that have elapsed since the previous
frame:

```ruby
def game_update_loop
    ...
    
    Tweener.step(delta_ms)

    ...
end
```

Then use `add_tween` to create tweens as needed. For example, this tween changes
the player's x and y coordinates over a span of 3000 milliseconds:

```ruby
Tweener.add_tween(player, { x: 10, y: 5 }, 3000)
```

Any tweens created with `Tweener` will start and be cleaned up automatically.
If you need greater control, you can create a `Tween` manually like so:

```ruby
@tween = Tsuku::Tween.new(player, { x: 10, y: 5 }, 3000)
@tween.start
```

Now in your game update loop, advance the tween by calling its `step` method:

```ruby
@tween.step(delta_ms)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/jtuttle/tsuku.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
