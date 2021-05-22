# require "tty-prompt"
# require "tty-spinner"
# require "artii"

require_relative "./players"
require_relative "./enemy"
require_relative "./reward"

# @prompt = TTY::Prompt.new

#coins = 0
class Script
    attr_reader :playerClass, :strength, :monster, :damage, :enemy
    attr_accessor :health, :healthEnemy, :reward

    def initialize(playerClass, monster, classes, enemy)
        @playerClass = playerClass
        @players = Player.new
        @monster = monster
        @enemy = Monster.new
        populateStory(classes, enemy)
        @reward = Rewards.new
    end

    def populateStory(classes, enemy)
        classes.each do |playerClass, health, strength|
            @players.addPlayer(playerClass, health, strength)
        end
        enemy.each do |monster, health, damage|
            @enemy.addMonster(monster, health, damage)
        end
    end

    def addToInventory(item, quantity)
        @reward.addItem(item, quantity)
    end

    def getReward
        return @reward
    end

    def welcome
        puts "Welcome to the #{@title}!"
    end

    # def printScript  
end

# title = "Fantasy Adventure"
# classesOption = {Ninja: [health=20, strength=6], Warrior: [Health=10, strength=12], Wizard: [health=14, strength=8]}
# story = Script.new(playerClass, monster, classes, enemy)
# story.welcome
# story.printScript