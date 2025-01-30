class Show
  # Affiche le plateau de jeu
  def display_board(board)
    puts "    1   2   3"  # Affiche les numéros des colonnes
    puts "  +---+---+---+" # Ligne de séparation
    board.each_with_index do |row, index|
      # Affiche la lettre de la ligne (A, B, C)
      print "#{('A'.ord + index).chr} |"
      row.each do |cell|
        if cell == "X"
          # Affiche "X" en bleu
          print " #{cell} ".colorize(:blue) + "|"
        elsif cell == "O"
          # Affiche "O" en vert
          print " #{cell} ".colorize(:green) + "|"
        else
          # Affiche une case vide
          print " #{cell} |"
        end
      end
      puts "\n  +---+---+---+" # Ligne de séparation
    end
  end

  # Affiche un message de victoire
  def display_winner(player)
    puts "#{player.name} a gagné !"
  end

  # Affiche un message de match nul
  def display_draw
    puts "Match nul !"
  end
end