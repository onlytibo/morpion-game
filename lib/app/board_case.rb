class BoardCase
  attr_accessor :coord, :state
  
  def initialize(coord, state = " ") # on initialise les cellules du tableau avec un " "
    @coord = coord # coord correspond à A1, A2...
    @state = state # correspond à la valeur prise par la cellule "x", "o", " "
  end
end