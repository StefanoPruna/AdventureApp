class Character
    attr_accessor :playerClass, :health, :strength

    def initialize(name, health, strength)
        @playerClass = {}
        @name = name
        @health = health
        @strength = strength
    end
    
    def getClass
        @playerClass[:name, :health, :strength]
    end

    def getHealth
    end

    def getStrength
    end

    def to_s
        return "Your class is #{name}, your health is #{health} and your strength is #{strength}"
    end
end
