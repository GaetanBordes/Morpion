class Board
  def initialize
    # Crée un plateau avec 9 cases 
    @cases = [
      BoardCase.new("A1"), BoardCase.new("A2"), BoardCase.new("A3"),
      BoardCase.new("B1"), BoardCase.new("B2"), BoardCase.new("B3"),
      BoardCase.new("C1"), BoardCase.new("C2"), BoardCase.new("C3")
    ]
  end

  # Affiche le plateau de jeu
  def display
    puts "    1   2   3"  # numéros des colonnes
    puts "  +---+---+---+" # Ligne de séparation
    rows = @cases.each_slice(3).to_a # Divise les cases en 3 lignes
    rows.each_with_index do |row, index|
      # Affiche la lettre de la ligne
      print "#{('A'.ord + index).chr} |"
      row.each do |board_case|
        print "#{board_case.display}|" # case avec des couleurs
      end
      puts "\n  +---+---+---+" # Ligne de séparation
    end
  end

  # Vérifie si une case est vide
  def cell_empty?(position)
    board_case = find_case(position) # Trouve la case correspondante
    board_case.empty? # Vérifie si la case est vide
  end

  # Place un symbole sur le plateau
  def place_symbol(position, symbol)
    board_case = find_case(position) # Trouve la case correspondante
    board_case.value = symbol # Place le symbole dans la case
  end

  # Vérifie s'il y a un gagnant
  def winner?(symbol)
    # Vérifie les lignes, colonnes et diagonales
    winning_lines.any? do |line|
      line.all? { |position| find_case(position).value == symbol }
    end
  end

  # Vérifie si le plateau est plein (match nul)
  def full?
    @cases.none?(&:empty?) # Vérifie s'il reste des cases vides
  end

  private

  # Trouve une case par sa position 
  def find_case(position)
    @cases.find { |board_case| board_case.position == position }
  end

  # Définit les combinaisons gagnantes (lignes, colonnes, diagonales)
  def winning_lines
    [
      ["A1", "A2", "A3"], # Ligne 1
      ["B1", "B2", "B3"], # Ligne 2
      ["C1", "C2", "C3"], # Ligne 3
      ["A1", "B1", "C1"], # Colonne 1
      ["A2", "B2", "C2"], # Colonne 2
      ["A3", "B3", "C3"], # Colonne 3
      ["A1", "B2", "C3"], # Diagonale principale
      ["A3", "B2", "C1"]  # Diagonale secondaire
    ]
  end
end