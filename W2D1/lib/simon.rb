class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @colors = COLORS
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    p @seq
  end

  def require_sequence
    puts "repeat the given sequence..."
    input_loop(0)
    return if @game_over
    (@seq.length - 1).times do |idx|
      puts "next color: "
      input_loop(idx + 1)
      break if @game_over
    end
  end

  def add_random_color
    @seq << @colors.sample
  end

  def round_success_message
    puts "congrats, you correctly guessed the sequence"
  end

  def game_over_message
    puts "sorry, you incorrectly guessed the sequence"
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end

  def input_loop(idx)
    input = gets.chomp.strip
    @game_over = true unless input == @seq[idx]
  end
end
