class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = place_stones
            
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
   array =  Array.new(14) {[]}
   array.each_with_index do |cup, idx|
    next if idx == 6 || idx == 13
    i = 0
    while i < 4
      cup << :stone
      i += 1
    end
   end
   array
  end

  def [](pos)
    self.cups[pos]
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if self.cups[start_pos] == nil
    raise "Starting cup is empty" if  self.cups[start_pos].length == 0
  end

  def make_move(start_pos, current_player_name)
    i = start_pos + 1
    while self.cups[start_pos].length != 0
      if (7..13).include?(i) 
        i += 1
        i = i % self.cups.length
      end
      self.cups[i] << self.cups[start_pos].shift
      i += 1
      j = i 
      i = i % 6
    end
    self.render
    result = next_turn(j)
    result
  end

  def next_turn(ending_cup_idx)
   
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    # print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    # puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    # print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    # puts ""
    # puts ""
  end

  def one_side_empty?
    (1..5).each do |int|
      return false if self.cups[int].length != 0
    end
    true
  end

  def winner
    if self.cups[6].length == self.cups[13].length 
      return :draw
    elsif self.cups[6].length == 6
      "#{@name1}"
    end
  end
end
