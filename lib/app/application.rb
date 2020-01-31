class Application
  attr_accessor :game
  @@game_count = 0

  def initialize
    # création d'une instance Application, qui démarre une partie
    start = Application.start_a_game 
  end

  # compteur de partie
  def self.game_count 
    @@game_count = @@game_count + 1
    puts "Partie n°#{@@game_count}"
  end

  def self.start_a_game

    game_count # Compter une partie
    if @@game_count <= 1
      head
    end
    puts "Pour commencer une partie, dites 'go'"
    print "> "
    choice_menu = gets.chomp
      while choice_menu != "go" # gestion des saisies non conformes
        puts "Try again"
        print "> "
        choice_menu = gets.chomp
      end
      system("clear")
    @game = Game.new # création d'une instance game de la class Game pour lancer une partie !
  end

  def self.head
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
    puts "\n\n"
  end

end