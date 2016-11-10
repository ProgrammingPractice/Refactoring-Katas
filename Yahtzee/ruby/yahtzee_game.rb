class YahtzeeGame
  def play
    display_greeting
    
    1.times do
    #   each_player do
    #     play_round(player)
          puts "Player 1's turn"
          puts 'Press Enter to roll'

          ARGF.readline

          roll = [1,2,3,4,5]

          puts "You rolled: #{roll.inspect}"


          # choose what you keep
          # roll
          # choose what you keep
          # roll
          # choose category
          # score_roll(roll)
          # add roll points to total
    #   end
    end

    # display results
  end

  def display_greeting
    puts 'Welcome to Yahtzee!'
  end
end
