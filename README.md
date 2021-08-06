# Linked list access optimizing challenge

The aim of this project is to try out different singly-linked list item access
optimizations. There's already an implementation of move-to-front which can be
taken as a starting point. You can implement your own [here](lib/strategies/your_own_strategy.rb)

## Installation

Ruby 3.0.2 via *rbenv* is recommended. But it should work with older rubies,
too.

    bundle install

## Testing

There are automated tests:

    rspec

and there is a tool with which you can let different strategies compete with
each other:

    bin/run

```sh
Initializing experiment with random seed 332095111362380301526561001813048765481
Strategy: Normal unoptimized linked list
  goethe_wette: 90329186
Strategy: Linked list optimized with move to front
  goethe_wette: 41154823
Strategy: Linked list optimized with BEST STRATEGY EVAA11!11
  goethe_wette: 89940145
```

## Copyright

2009-2021 Josua Schmid under the MIT license
