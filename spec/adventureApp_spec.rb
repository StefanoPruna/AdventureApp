# require "tty-prompt"
# require "tty-spinner"
# require "artii"

#require_relative "../script"
require_relative "../enemy"
require_relative "../classes"
require_relative "../players"

describe Character do
    # it "Should return the player class" do
    #     playerClass = "Ninja"
    #     health = 20
    #     strength = 6
    #     classes = Character.new(playerClass, health, strength)
    #     expect(classes.).to eq(playerClass)
    # end
    it "Should return the player's health" do
        playerClass = "Ninja"
        health = 20
        strength = 6
        classes = Character.new(playerClass, health, strength)
        expect(classes.health).to eq(health)        
    end
    it "Should return the strength of the player" do
        playerClass = "Ninja"
        health = 20
        strength = 6
        classes = Character.new(playerClass, health, strength)
        expect(classes.strength).to eq(strength)
    end
end

describe Player do
    it "Should be able to get the character's health" do
        playerClass = "Ninja"
        health = 20
        strength = 6
        players = Player.new
        players.addPlayer(playerClass, health, strength)
        expect(players.getPlayerHealth(playerClass)).to eq(health)
    end
    it "Should be able to get the character's strength" do
        playerClass = "Ninja"
        health = 20
        strength = 6
        players = Player.new
        players.addPlayer(playerClass, health, strength)
        expect(players.getPlayerStrength(playerClass)).to eq(strength)
    end    
    it "should be able to add a player" do
        playerClass = "Ninja"
        health = 20
        strength = 6
        players = Player.new
        players.addPlayer(playerClass, health,strength)
        expect(players.getPlayer().length).to be(1)
    end
end