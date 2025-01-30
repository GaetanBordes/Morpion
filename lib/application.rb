class Application
  def initialize
    @show = Show.new # Initialise l'affichage
  end

  # Méthode principale pour lancer le jeu
  def start
    puts "Bienvenue dans le jeu de morpion !"
    loop do
      game = Game.new(@show) # Crée une nouvelle partie
      game.start # Démarre la partie

      # Demande si les joueurs veulent rejouer
      puts "Voulez-vous rejouer ? (O/N)"
      answer = gets.chomp.upcase
      break unless answer == "O" # Quitte la boucle si la réponse n'est pas "O"
    end
    puts "Merci d'avoir joué ! À bientôt !"
  end
end