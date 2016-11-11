#! /usr/bin/env ruby

require './yahtzee_game'

game = YahtzeeGame.new

def display_roll(roll)
  puts "You rolled: ", roll.inspect
end

def user_selects_category(game)
  puts "Please select the category for this roll ^^"
  puts game.categories
  3
end

display_roll(game.roll)
category = user_selects_category(game)
game.place_in_category(category)
display_score(game.score)
