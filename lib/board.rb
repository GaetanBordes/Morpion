require 'colorize'

class Board
  def initialize
    @board = Array.new(3) { Array.new(3, " ") } # plateau 3*3 vide
  end

  def display
    puts "    1   2   3" # numéros de colonne
    puts "  +---+---+---+" # séparation
    @board.each_with_index do |row, index|
      print "#{('A'.ord + index).chr} |" # affiche la lettre de la ligne
      row.each do |cell|
        if cell == "X"
          print " #{cell} ".colorize(:blue) + "|" # affiche x en bleu
        elsif cell == "0"
          print " #{cell}".colorize(:green) + "|" # affiche o en vert
        else
          print " #{cell} |" # affiche une case vide
        end
      end
      puts "\n +---+---+---+" # séparation
    end
  end

  def cell_empty?(position) # vérification case vide
    row, col = translate_position(position)
    @board[row][col] == " "
  end

  def place_symbol(position, symbol) # place un symbole sur le plateau
    row, col = translate_position(position)
    @board[row][col] = symbol
  end

  def winner?(symbol) # vérification si gagnant
    @board.any? { |row| row.uniq.size == 1 && row.first == symbol } || # Lignes
    @board.transpose.any? { |col| col.uniq.size == 1 && col.first == symbol } || # Colonnes
    (0..2).all? { |i| @board[i][i] == symbol } || # Diagonale principale
    (0..2).all? { |i| @board[i][2 - i] == symbol } # Diagonale secondaire
  end

  def full? # plateau plein = match nul
    @board.flatten.none? { |cell| cell == " " } # Vérifie s'il reste des cases vides
  end

  private

  # Convertit une position comme "A1" en indices de tableau [0, 0]
  def translate_position(position)
    row = position[0].upcase.ord - 'A'.ord 
    col = position[1].to_i - 1 
    [row, col]
  end
end