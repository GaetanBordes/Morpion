class Board
  def initialize
    # Crée un plateau 3x3 rempli d'espaces vides
    @board = Array.new(3) { Array.new(3, " ") }
  end

  # Retourne le plateau actuel
  def current_state
    @board
  end

  # Vérifie si une case est vide
  def cell_empty?(position)
    row, col = translate_position(position) # Convertit la position en indices
    @board[row][col] == " " # Vérifie si la case est vide
  end

  # Place un symbole sur le plateau
  def place_symbol(position, symbol)
    row, col = translate_position(position) # Convertit la position en indices
    @board[row][col] = symbol # Place le symbole dans la case
  end

  # Vérifie s'il y a un gagnant
  def winner?(symbol)
    # Vérifie les lignes, colonnes et diagonales
    @board.any? { |row| row.uniq.size == 1 && row.first == symbol } || # Lignes
    @board.transpose.any? { |col| col.uniq.size == 1 && col.first == symbol } || # Colonnes
    (0..2).all? { |i| @board[i][i] == symbol } || # Diagonale principale
    (0..2).all? { |i| @board[i][2 - i] == symbol } # Diagonale secondaire
  end

  # Vérifie si le plateau est plein (match nul)
  def full?
    @board.flatten.none? { |cell| cell == " " } # Vérifie s'il reste des cases vides
  end

  private

  # Convertit une position comme "A1" en indices de tableau [0, 0]
  def translate_position(position)
    row = position[0].upcase.ord - 'A'.ord # Convertit la lettre en indice (A=0, B=1, C=2)
    col = position[1].to_i - 1 # Convertit le chiffre en indice (1=0, 2=1, 3=2)
    [row, col]
  end
end