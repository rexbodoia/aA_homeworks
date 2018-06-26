class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    @cups.each_index do |idx|
      4.times { @cups[idx] << :stone } unless [6,13].include?(idx)
    end
  end

  def valid_move?(start_pos)
    unless (0..12).include?(start_pos) && start_pos != 6
      raise "Invalid starting cup"
    end
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].length
    @cups[start_pos] = []
    count = 1
    until count > stones
      idx = (start_pos + count) % 14
      case current_player_name
      when @name1
        other_side = 2
      when @name2
        other_side = 1
      end
      if idx == other_side * 7 - 1
        stones += 1
      else
        @cups[idx] << :stone
      end
      count += 1
    end
    render
    next_turn((start_pos + count - 1) % 14)
  end

  def next_turn(ending_cup_idx)
    return :prompt if [6,13].include?(ending_cup_idx)
    return :switch if @cups[ending_cup_idx].count == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    blk = proc { |cup| cup.empty? }
    @cups[0..5].all?(&blk) || @cups[7..12].all?(&blk)
  end

  def winner
    score1 = @cups[6].count
    score2 = @cups[13].count
    case score1 <=> score2
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end
  end
end
