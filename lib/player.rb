class Player
  attr_reader :name, :symbol

  def initialize(name, symbol) # Ibitialise un joueur en associant le symbole X ou O
    @name = name
    @symbol = symbol
  end
end
