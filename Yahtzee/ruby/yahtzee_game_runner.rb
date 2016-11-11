#! /usr/bin/env ruby

require './yahtzee_game'

game = YahtzeeGame.new

display_roll(game.roll)
cathegory = ask_user_to_select_cathegory
game.put_in_cathegory(cathegory)
display_score(game.score)
