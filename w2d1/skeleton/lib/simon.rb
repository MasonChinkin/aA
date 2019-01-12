require "byebug"

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    until self.game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    attempt = require_sequence

    if attempt != self.seq
      round_success_message
      self.sequence_length += 1
    else
      self.game_over = true
    end
  end

  def show_sequence
    self.add_random_color
    puts self.seq
  end

  def require_sequence
    puts "try to copy the sequence"
    puts "seperate colors by a comma (ex. 'green,red,blue')"
    attempt = gets.chomp

    attempt.split(",")
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "nice job!"
  end

  def game_over_message
    puts "ya fucked up"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if $PROGRAM_NAME == __FILE__
  Simon.new.play
end
