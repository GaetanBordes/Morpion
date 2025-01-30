class Game
  def initialize 
    @board = Board.new # nouveau plateau
    @players = []  # liste des joueurs
    @current_player  # joueur actuel
    @game_over = false # état de la partie
  end

  def setup_players # initialise les joueurs
    puts "Entrez le prénom du joueur 1 (X) :"
    name1 = gets.chomp # joueur 1
    @players << Player.new(name1, "X") # crée le joueur 1 avec X

    puts "Entrez le prénom du joueur 2 (O) :"
    name2 = gets.chomp # joueur 2
    @players << Player.new(name2, "O") # crée le joueur 2 avec O

    @current_player = @players.first
  end

  def start # commence le jeu
    setup_players
    until @game_over # boucle jusqu'à la fin
      @board.display # affiche le plateau
      play_turn # joue un tour
      check_game_over # vérifie si partie terminée
      switch_player unless @game_over # change de joueur a part si partie terminée
    end
    play_again? # rejouer ?
  end

  def play_turn
    puts "#{@current_player.name}, sélectionnez une case vide !" # tour de jeu
    position = gets.chomp.upcase

    if valid_move?(position) # vérifie si position valide
      @board.place_symbol(position, @current_player.symbol) # place le symbole
    else
      puts "Position invalide, Réessayez." # message d'erreur
      play_turn # demande la position à nouveau
    end
  end

  def valid_move?(position) 
    position.match?(/^[A-C][1-3]$/) && @board.cell_empty?(position)
  end

  def check_game_over # vérification partie terminée
    if @board.winner?(@current_player.symbol)
      @board.display
      puts "#{@current_player.name} a gagné !" # vérifie si le joueur actuel a gagné
      @game_over = true
    elsif @board.full? # vérifie si plateau plein = match nul
      @board.display
      puts "Match nul !"
      @game_over = true
    end
  end

  def switch_player # change de joueur
    @current_player = @current_player == @players.first ? @players.last : @players.first
  end

  def play_again? # propose de rejouer
    puts "Voulez-vous rejouer ? (O/N)"
    answer = gets.chomp.upcase
    if answer == "O"
      @board = Board.new
      @game_over = false
      start
    else
      puts "Merci d'avoir joué !"
    end
  end
end