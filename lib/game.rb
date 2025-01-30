class Game
  def initialize(show)
    @board = Board.new # Crée un nouveau plateau
    @players = []      # Liste des joueurs
    @current_player = nil # Joueur actuel
    @game_over = false # État de la partie
    @show = show       # Instance de Show pour l'affichage
  end

  # Initialise les joueurs
  def setup_players
    puts "Entrez le prénom du joueur 1 (X) :"
    name1 = gets.chomp # Demande le nom du joueur 1
    @players << Player.new(name1, "X") # Crée le joueur 1 avec le symbole X

    puts "Entrez le prénom du joueur 2 (O) :"
    name2 = gets.chomp # Demande le nom du joueur 2
    @players << Player.new(name2, "O") # Crée le joueur 2 avec le symbole O

    @current_player = @players.first # Commence avec le joueur 1
  end

  # Démarre le jeu
  def start
    setup_players # Initialise les joueurs
    until @game_over # Boucle jusqu'à la fin de la partie
      @show.display_board(@board.current_state) # Affiche le plateau
      play_turn      # Joue un tour
      check_game_over # Vérifie si la partie est terminée
      switch_player unless @game_over # Change de joueur sauf si la partie est finie
    end
  end

  # Gère un tour de jeu
  def play_turn
    puts "#{@current_player.name}, où souhaitez-vous jouer ? (ex: A1)"
    position = gets.chomp.upcase # Demande la position au joueur

    if valid_move?(position) # Vérifie si la position est valide
      @board.place_symbol(position, @current_player.symbol) # Place le symbole
    else
      puts "Position invalide. Réessayez." # Affiche un message d'erreur
      play_turn # Redemande la position
    end
  end

  # Vérifie si la position est valide
  def valid_move?(position)
    # Vérifie que la position est au format "A1", "B2", etc. et que la case est vide
    position.match?(/^[A-C][1-3]$/) && @board.cell_empty?(position)
  end

  # Vérifie si la partie est terminée
  def check_game_over
    if @board.winner?(@current_player.symbol) # Vérifie si le joueur actuel a gagné
      @show.display_board(@board.current_state) # Affiche le plateau
      @show.display_winner(@current_player) # Affiche le gagnant
      @game_over = true
    elsif @board.full? # Vérifie si le plateau est plein (match nul)
      @show.display_board(@board.current_state) # Affiche le plateau
      @show.display_draw # Affiche un message de match nul
      @game_over = true
    end
  end

  # Change de joueur
  def switch_player
    @current_player = @current_player == @players.first ? @players.last : @players.first
  end
end