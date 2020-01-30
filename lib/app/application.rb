class Application
  attr_accessor :game
  @@game_count = 0
  def initialize
    @game = Game.new
    # puts "Pour commencer une partie, appuyez sur Entrée"
    # print "> "
    # choice_menu = gets.chomp
    #   if choice_menu == "o"
      
    #   end
  end

  def self.game_count
    @@game_count = @@game_count + 1
    puts "c'est la partie : #{@@game_count}"
  end

  def start_a_game
  end


end