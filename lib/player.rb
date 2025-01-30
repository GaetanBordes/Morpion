class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name   # Le nom du joueur
    @symbol = symbol # Le symbole du joueur (X ou O)
  end
end