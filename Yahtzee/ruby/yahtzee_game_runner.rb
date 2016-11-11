#! /usr/bin/env ruby

require './yahtzee_game'

game = YahtzeeGame.new

def display_roll(roll)
  puts "You rolled: ", roll.inspect
end

def user_selects_cathegory(game)
  puts "Please select the category for this roll ^^"
  puts game.cathegories
  3
end

display_roll(game.roll)
cathegory = user_selects_cathegory(game)
game.place_in_cathegory(cathegory)
display_score(game.score)
