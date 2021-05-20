class Character
    #attr_accessor :playerClass, :health, :strength, :players
    attr_reader :playerClass, :health, :strength

    def initialize(playerClass, health, strength)
        @playerClass = playerClass      
        @health = health
        @strength = strength
    end
    
    def to_s
        return "Your class is #{playerClass}, your health is #{health} and your strength is #{strength}"
    end
end
