class BoardCase
  attr_accessor :value # La valeur de la case (" ", "X" ou "O")
  attr_reader :position # La position de la case (ex: "A1")

  def initialize(position)
    @position = position # La position de la case (ex: "A1")
    @value = " "         # La valeur par défaut est un espace vide
  end

  # Méthode pour vérifier si la case est vide
  def empty?
    @value == " "
  end

  # Méthode pour afficher la case avec des couleurs
  def display
    if @value == "X"
      " #{@value} ".colorize(:blue)
    elsif @value == "O"
      " #{@value} ".colorize(:green)
    else
      " #{@value} "
    end
  end
end