class Enemies
    attr_reader :monster, :healthEnemy, :damage

    def initialize(monster, healthEnemy, damage)
        @monster = monster      
        @healthEnemy = healthEnemy
        @damage = damage
    end
    
    def to_s
        return "A #{monster} is approaching you, his health is #{healthEnemy} and he inflicts #{damage}"
    end
end