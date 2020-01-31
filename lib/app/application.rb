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
    puts "
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Bienvenue sur le jeu du MORPION
  by Micamya & Tibo \u{1f60e}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    
    game_count # Compter une partie
    puts "Pour commencer une partie, dites 'go'"
    print "> "
    choice_menu = gets.chomp
      while choice_menu != "go" # gestion des saisies non conformes
        puts "Try again"
        print "> "
        choice_menu = gets.chomp
      end
    @game = Game.new # création d'une instance game de la class Game pour lancer une partie !
  end


end