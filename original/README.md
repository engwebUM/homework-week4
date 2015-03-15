# Homework - Week 3

1. Fork this repository
2. Clone it to your computer
3. Do the exercise in `bowling.rb` and `bowling_spec.rb`
3. Do each of the exercises in the exercise directories
4. Push your solutions to your GitHub repository
5. When you feel confident with your solution, open a pull request to
`engwebUM/homework-week3`

# Scoring Bowling

![Bowling Score](pins.jpg)

The game consists of 10 frames as shown above. In each frame the player has
two opportunities to knock down 10 pins. The score for the frame is the total
number of pins knocked down, plus bonuses for strikes and spares.

A spare is when the player knocks down all 10 pins in two tries. The bonus for
that frame is the number of pins knocked down by the next roll. So in frame 3
above, the score is 10 (the total number knocked down) plus a bonus of 5 (the
number of pins knocked down on the next roll.).

A strike is when the player knocks down all 10 pins on his first try. The bonus
for that frame is the value of the next two balls rolled.

In the tenth frame a player who rolls a spare or strike is allowed to roll the extra
balls to complete the frame. However no more than three balls can be rolled in
tenth frame.

# Installing RSpec

Run `bundle install` in the directory where the `Gemfile` is located.
If you get a `command not found: bundle`, run `gem install bundler` first

# Running RSpec

Run `rspec bowling_spec.rb`

If you get a `rspec: command not found`, try this instead:

```
bundle exec rspec bowling_spec.rb
```
