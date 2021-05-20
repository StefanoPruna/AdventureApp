require_relative "./classes"

class Player
    def initialize
        @classes = []
    end

    def addPlayer(playerClass, health, strength)
        classes = Character.new(playerClass, health, strength)
        @classes << classes
    end

    def getPlayerHealth(playerClass)
        playerHealth = @classes.find {|classes| classes.playerClass == playerClass}
        return playerHealth.health
    end

    def getPlayerStrength(playerClass)
        playerStrength = @classes.find {|classes| classes.playerClass == playerClass}
        return playerStrength.strength
    end

    def getPlayer
        return @classes
    end
end

