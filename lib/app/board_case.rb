class BoardCase
  attr_accessor :coord, :state
  
  def initialize(coord, state = " ")
    @coord = coord
    @state = state
  end

  def change_state
    @cell = ""  
    hash["A1"] = camille.symbol
  end

end