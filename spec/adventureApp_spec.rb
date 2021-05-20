# require "tty-prompt"
# require "tty-spinner"
# require "artii"

#require_relative "../script"
require_relative "../enemy"
require_relative "../classes"

describe Character do
    it "Should return the player class" do
        playerClass = "Ninja"
        health = 20
        strength = 6
        classes = Character.new
        classes.addClass(playerClass, health, strength)
        expect(classes.getClass(playerClass)).to eq(playerClass)
    end

    it "get the health of the player character chosen" do
        playerClass = ""
        health = 20
        strength = 6
        classes = Character.new
        classes.addClass(playerClass, health, strength)
        expect(classes.getHealth(health)).to eq(health)        
    end

    it "Should return the strength of the player character" do
        playerClass = ""
        health = 20
        strength = 6
        classes = Character.new
        classes.addClass(playerClass, health, strength)
        expect(classes.getStrength(strength)).to eq(strength)
    end
end