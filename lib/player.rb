class Player

  attr_accessor :name, :life_points
  
  def initialize(name, life_points = 10)
        @name = name 
        @life_points = life_points
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie !"
  end

  def gets_damage(player_damage)
    @life_points = @life_points - player_damage
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué ! RIP !"
    end
    return @life_points
  end

  def attacks(player)
        puts "Le joueur #{name} attaque le joueur #{player.name}."
        attacks_damage = compute_damage
        player.gets_damage(attacks_damage)
        if player.life_points > 0
        puts "Il lui inflige #{attacks_damage} points de dommage."
        end
  end

  def compute_damage
    return rand(1..6)
  end
end