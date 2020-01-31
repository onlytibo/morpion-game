class Board
  attr_accessor :state, :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3, :show
  @@state_of_game = "" # variable de class qui retourne la situation dans le jeu : ex aequo, victoire ou continuation

  def initialize
    # On créer toutes les cellules et on les range dans un tableau. Chaque cellule à une coordonnée.
    @boardcase_ary = [@a1 = BoardCase.new("A1")]
    @boardcase_ary << @a2 = BoardCase.new("A2")
    @boardcase_ary << @a3 = BoardCase.new("A3")
    @boardcase_ary << @b1 = BoardCase.new("B1")
    @boardcase_ary << @b2 = BoardCase.new("B2")
    @boardcase_ary << @b3 = BoardCase.new("B3")
    @boardcase_ary << @c1 = BoardCase.new("C1")
    @boardcase_ary << @c2 = BoardCase.new("C2")
    @boardcase_ary << @c3 = BoardCase.new("C3")

    # on crée un array de hashes qui contient des hashes des situations gagnantes, ex: {A1 => x, A2 => x, A3 => x}
    @victory_check_ary = [
      {@a1.coord => @a1.state,@a2.coord => @a2.state,@a3.coord => @a3.state},
      {@b1.coord => @b1.state,@b2.coord => @b2.state,@b3.coord => @b3.state},
      {@c1.coord => @c1.state,@c2.coord => @c2.state,@c3.coord => @c3.state},
      {@a1.coord => @a1.state,@b1.coord => @b1.state,@c1.coord => @b1.state},
      {@a2.coord => @a2.state,@b2.coord => @b2.state,@c2.coord => @b2.state},
      {@a3.coord => @a3.state,@b3.coord => @b3.state,@c3.coord => @c3.state},
      {@a1.coord => @a1.state,@b2.coord => @b2.state,@c3.coord => @c3.state},
      {@a3.coord => @a3.state,@b2.coord => @b2.state,@c1.coord => @c1.state}
    ]
  end


def replace_case_x(choice) # on remplace la valeur par le symbol du joueur
    @boardcase_ary.map do |boardcase|
      if boardcase.coord == choice 
        boardcase.state = "x"
      end
    end
    return @boardcase_ary
end

def replace_case_x_victory_ary(choice) # on remplace la valeur par le symbol du joueur dans le tableau des situations gagnantes
  @victory_check_ary.each do |h|
      if h.has_key?(choice)
        h[choice] = "x"
      end
  end
  return @victory_check_ary
end

def replace_case_o(choice) # on remplace la valeur par le symbol du joueur
    @boardcase_ary.map do |boardcase|
      if boardcase.coord == choice 
        boardcase.state = "o"
      end
    end
    return @boardcase_ary
end

def replace_case_o_victory_ary(choice) # on remplace la valeur par le symbol du joueur dans le tableau des situations gagnantes
  @victory_check_ary.each do |h|
      if h.has_key?(choice)
        h[choice] = "o"
      end
  end
  return @victory_check_ary
end

  def is_full? # on verifie si c'est une grille ex-aequo ou pas
    board_full = @victory_check_ary.map {|h| h.has_value?(" ")} # on cherche dans chaque hash s'il y a encore des états vides " ". on retourne true ou false [true, true, false, false]
    if !board_full.include?(true)
      @@state_of_game = "full"
      else 
      @@state_of_game = ""
    end
  end

  def victory? # on check si on detecte une victoire
    @victory_check_ary.each do |h| # on each sur chaque hash du tableau [{combinaison gagnantes},{combinaison gagnantes}...]

      line_to_check_ary = h.map do |k,v| # on extrait les hashs et on map dessus. {"A1" => "x", "A2" => "x", "A3" => "x"} 
        "#{v}" # affiche toutes les valeurs du hash qu'il parcours genre "x" puis "x" puis "x", qu'on stock dans un tableau [x, x, x]
      end

      if line_to_check_ary.join('') == "xxx" # on join('') sur le tableau [x, x, x], donc on a "xxx" en return
        @@state_of_game = "player 1 win" # on retourne la victoire joueur 1
        return @@state_of_game
      elsif line_to_check_ary.join('') == "ooo" # pareil pour detecter la victoire du joueur 2
        @@state_of_game = "player 2 win"
        return @@state_of_game
      else
        next # permet de passer au each suivant
      end

    end

    @@state_of_game = is_full? # si pas de victoire détectée, on recherche si le plateau est plein
    return @@state_of_game
  end

  def p1_choose_coord(coord) # appeler la fonction pour placer les "x" dans les cases du board
    @boardcase_ary = replace_case_x(coord)
  end

  def p1_choose_coord_vic(coord) # appeler la fonction pour placer les "x" dans le tableau des situations gagnantes
    @victory_check_ary = replace_case_x_victory_ary(coord)
  end

  def p2_choose_coord(coord) # appeler la fonction pour placer les "o" dans les cases du board
    @boardcase_ary = replace_case_o(coord)
  end

  def p2_choose_coord_vic(coord) # appeler la fonction pour placer les "o" dans le tableau des situations gagnantes
    @victory_check_ary = replace_case_o_victory_ary(coord)
  end
end