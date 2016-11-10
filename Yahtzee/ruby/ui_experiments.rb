require 'remedy'

include Remedy

screen = Viewport.new
user_input = Interaction.new

cursor = 0
values = %w(. . . . .)
user_input.loop do |key|
  if key.to_s == 'right'
    cursor += 1
  end
  if key.to_s == 'left'
    cursor -= 1
  end
  if key.to_s == 'space'
    if values[cursor] == 'X'
      values[cursor] = '.'
    else
      values[cursor] = 'X'
    end
  end

  cursor_line = [' '] * 5
  cursor_line[cursor] = '|'

  content = Content.new
  content << values.join
  content << cursor_line.join
  screen.draw content
end
