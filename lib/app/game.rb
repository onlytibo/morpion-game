class Game
  attr_accessor :player1, :player2, :show

  def initialize
    # on crée le joueur 1
    system("clear")
    header
    puts "Joueur 1,tu seras le panda, choisis un pseudo :"
    print "\u{1f43c} > "
    name_player1 = gets.chomp
    symbol_player1 = "x"    
    @player1 = Player.new(name_player1, symbol_player1)

    system("clear")
    header
    # on crée le joueur 2
    puts "Joueur 2, tu seras le lion, choisis un pseudo :"
    print "\u{1f42f} > "
    name_player2 = gets.chomp
    symbol_player2 = "o"
    @player2 = Player.new(name_player2, symbol_player2)

    # création d'une instance de Show pour créer les autres éléments de la partie (board et cellules)
    @show = Show.new

    # affichage du board
    system("clear")
    header
    @show.display_board

    # lancement de la méthode qui boucle tant que le jeu n'est pas full ou victoire
    turn
  end
  def header
    puts "="*56
    puts "
                                    d8b                 
                                    Y8P                 
                                                        
88888b.d88b.  .d88b. 888d88888888b. 888 .d88b. 88888b.  
888 '888 '88bd88''88b888P'  888 '88b888d88''88b888 '88b 
888  888  888888  888888    888  888888888  888888  888 
888  888  888Y88..88P888    888 d88P888Y88..88P888  888 
888  888  888 'Y88P' 888    88888P' 888 'Y88P' 888  888 
                            888                         
                            888   by Micamya & Tibo                      
                            888                        "
    puts "="*56
    puts "Partie n°#{Application.class_variable_get(:@@game_count)}"
    puts "\n\n"

  end

  def turn
    while @show.board.victory? != "full" && @show.board.victory? != "player 1 win" && @show.board.victory? != "player 2 win" # tant que @@state_of_game ne prend pas une valeur full ou victoire
      
      puts "_________________________________________"
      print "\u{1f43c} #{@player1.name}, à ton tour choisis une coordonnée : "
      p1_choice = gets.chomp
      p1_choice = p1_choice.upcase

      # tant que la saisie n'est pas correcte, on gère l'erreur
      while p1_choice != "A1" && p1_choice != "A2" && p1_choice != "A3" && p1_choice != "B1" && p1_choice != "B2" && p1_choice != "B3" && p1_choice != "C1" && p1_choice != "C2" && p1_choice != "C3"
        
        puts "Merci de saisir une coordonnée du genre A1, A2... tu connais quoi !"
        print "> "
        p1_choice = gets.chomp
        p1_choice = p1_choice.upcase

      end
      
      @show.board.p1_choose_coord(p1_choice) # on remplace les coordonnées choisies par le joueur 1, par son symbol, dans le tableau des cellules (on lance les méthodes qui font ça)
      @show.board.p1_choose_coord_vic(p1_choice) # pareil mais dans le tableau des situations gagnantes
      system("clear")
      header
      @show.display_board # on affiche le board dans son état mis à jour

      # on check si full ou si victoire suite au coup du joueur
      if @show.board.victory? == "full" || @show.board.victory? == "player 1 win" || @show.board.victory? == "player 2 win" 
        if @show.board.victory? == "full" # message si full
          puts "Ex-aéquo :)\nTry again !\n~~~~~~~~~~~~~"
          new_game = Application.new
        else # message si joueur gagne
          puts "BRAVO \u{1f43c} #{@player1.name} \nYOU ROCK\n~~~~~~~~~~~~~"
          new_game = Application.new
        end

      else # si le jeu continue... on prend le choix de coordonnée du joueur 2
        puts "_________________________________________"
        print "\u{1f42f} #{@player2.name}, à ton tour choisis une coordonnée : "
        p2_choice = gets.chomp
        p2_choice = p2_choice.upcase
        
        # on gère la saisie correcte
        while p2_choice != "A1" && p2_choice != "A2" && p2_choice != "A3" && p2_choice != "B1" && p2_choice != "B2" && p2_choice != "B3" && p2_choice != "C1" && p2_choice != "C2" && p2_choice != "C3"
          
          puts "Merci de saisir une coordonnée du genre A1, A2... tu connais quoi !"
          print "> "
          p2_choice = gets.chomp
          p2_choice = p2_choice.upcase

        end

        @show.board.p2_choose_coord(p2_choice) # on remplace les coordonnées choisies par le joueur 1, par son symbol, dans le tableau des cellules (on lance les méthodes qui font ça)
        @show.board.p2_choose_coord_vic(p2_choice) # pareil mais dans le tableau des situations gagnantes
        system("clear")
        header
        @show.display_board # on affiche le board dans son état mis à jour

        # on check si full ou si victoire suite au coup du joueur
        if @show.board.victory? == "full" || @show.board.victory? == "player 1 win" || @show.board.victory? == "player 2 win" 
          if @show.board.victory? == "full" # message si full
            puts "Ex-aéquo :)\nTry again !\n~~~~~~~~~~~~~"
            new_game = Application.new
          else # message si joueur gagne !
            puts "BRAVO \u{1f42f} #{@player2.name} \nYOU ROCK\n~~~~~~~~~~~~~"
            new_game = Application.new
          end
        else
          next
        end
      end
    end
  end
end