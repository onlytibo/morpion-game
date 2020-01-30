class Show
  attr_accessor :board
  def initialize
    @board = Board.new
  end

  def game_count
    Application.game_count
  end

  def display_board
    puts "    1   2   3  
  ~~~~~~~~~~~~~
A | #{@board.a1.state} | #{@board.a2.state} | #{@board.a3.state} |
  ~~~~~~~~~~~~~
B | #{@board.b1.state} | #{@board.b2.state} | #{@board.b3.state} |
  ~~~~~~~~~~~~~
C | #{@board.c1.state} | #{@board.c2.state} | #{@board.c3.state} |
  ~~~~~~~~~~~~~"
  end 


  def player1_win
    puts "player 1 win"
  end

  def player2_win
    puts "player 2 win"
  end


end