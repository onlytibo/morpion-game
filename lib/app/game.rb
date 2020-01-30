class Game
  attr_accessor :player1, :player2, :show
    @@state_of_game = ""

  def initialize
    puts "pseudo du player 1"
    symbol_player1 = "x"
    print "> "
    name_player1 = gets.chomp    
    @player1 = Player.new(name_player1, symbol_player1)
    puts "pseudo du player 2"
    
    symbol_player2 = "o"
    print "> "
    name_player2 = gets.chomp
    @player2 = Player.new(name_player2, symbol_player2)
    @show = Show.new
    @victory_check_ary = [
      {@show.board.a1.coord => @show.board.a1.state,@show.board.a2.coord => @show.board.a2.state,@show.board.a3.coord => @show.board.a3.state},
      {@show.board.b1.coord => @show.board.b1.state,@show.board.b2.coord => @show.board.b2.state,@show.board.b3.coord => @show.board.b3.state},
      {@show.board.c1.coord => @show.board.c1.state,@show.board.c2.coord => @show.board.c2.state,@show.board.c3.coord => @show.board.c3.state},
      {@show.board.a1.coord => @show.board.a1.state,@show.board.b1.coord => @show.board.b1.state,@show.board.c1.coord => @show.board.b1.state},
      {@show.board.a2.coord => @show.board.a2.state,@show.board.b2.coord => @show.board.b2.state,@show.board.c2.coord => @show.board.b2.state},
      {@show.board.a3.coord => @show.board.a3.state,@show.board.b3.coord => @show.board.b3.state,@show.board.c3.coord => @show.board.c3.state},
      {@show.board.a1.coord => @show.board.a1.state,@show.board.b2.coord => @show.board.b2.state,@show.board.c3.coord => @show.board.c3.state},
      {@show.board.a3.coord => @show.board.a3.state,@show.board.b2.coord => @show.board.b2.state,@show.board.c1.coord => @show.board.c1.state}
    ]
    @show.game_count
    @show.display_board
    turn
  end

  def select_coord

  end


  def victory_template(choice)
  # board.rb
    @victory_check_ary.map do |h|
      h.map do |k,v| 
        if k == choice
          puts @player1.symbol # x
          puts choice # A1
          puts k # A1  k == choice
          puts v
          h[h.keys[1]] = @player1.symbol
        end
        # else
        #   next
        
      end
      return @victory_check_ary
    end
  end
  # board.rb
  def is_full?
    board_full = @victory_check_ary.map {|h| h.has_value?(" ")}
    if !board_full.include?(true)
      @@state_of_game = "full"
      puts @@state_of_game 
      # continuer de jouer 
    else 
      @@state_of_game = "continue"
      puts "continue"
    end
  end

  def victory?
    @victory_check_ary.each do |h|

      line_to_check_ary = h.map do |k,v| 
        "#{v}" # affiche toutes les valeurs du hash qu'il parcours genre "x" puis "x" puis "x"
      end

      if line_to_check_ary.join('') == "xxx"
        @@state_of_game = "player 1 win"
        puts "player 1 win"
        return @@state_of_game
        # end_of_game dans game.rb
        # Retour au menu
        # +1 au compteur de partie pour joueur 1
      elsif line_to_check_ary.join('') == "ooo"
        @@state_of_game = "player 1 win"
        puts "player 2 win"
        return @@state_of_game
        # Message de fin de Game
        # Retour au menu
        # +1 au compteur de partie pour joueur 2
      else
        next
      end

    end

    @@state_of_game = is_full?
    return @@state_of_game
  end


  def turn
    while @@state_of_game != "full" &&  @@state_of_game != "player 1 win" &&  @@state_of_game != "player 2 win"
      print "#{@player1.name} choisis une coordonnée"
      p1_choice = gets.chomp
      p1_choose_coord(p1_choice)
          @show.display_board
      
      print "#{@player2.name} choisis une coordonnée"
      p2_choice = gets.chomp
      p2_choose_coord(p2_choice)
          @show.display_board
    end
  end

  def p1_choose_coord(coord)
    @victory_check_ary = victory_template(coord)
  end

  def p2_choose_coord(coord)
    @victory_check_ary = victory_template(coord)
  end

  def end_of_game
    # soit full_grid
    
    # soit winner_is
    
    # retour au
  end

  def full_grid

  end

  def winner_is

  end



end