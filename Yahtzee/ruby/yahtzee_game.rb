class YahtzeeGame
  def self.play
    players = ['Player 1']

    puts 'Welcome to Yahtzee!'

    1.times do # number of rounds
      players.each do |player|
          puts "#{player}'s turn"
          puts 'Press Enter to roll'

          # ARGF.readline

          roll = [1,2,3,4,5]

          puts "You rolled: #{roll.inspect}"

          # choose what you keep
          # roll
          # choose what you keep
          # roll
          # choose category
          # score_roll(roll)
          # add roll points to total
      end
    end

    puts 'The final score is: TODO'
  end
end
