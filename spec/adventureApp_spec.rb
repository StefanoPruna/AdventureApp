# require "tty-prompt"
# require "tty-spinner"
# require "artii"

#require_relative "../script"
require_relative "../enemy"
require_relative "../monsters"
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

describe Enemies do
    it "Should return the monster's health" do
        monster = "Goblin"
        healthEnemy = 8
        damage = 5
        monsters = Enemies.new(monster, healthEnemy, damage)
        expect(monsters.healthEnemy).to eq(healthEnemy)        
    end
    it "Should return the hit that the monster inflicts" do
        monster = "Goblin"
        healthEnemy = 8
        damage = 5
        monsters = Enemies.new(monster, healthEnemy, damage)
        expect(monsters.damage).to eq(damage)
    end
end

describe Monster do
    it "Should be able to get the monster's health" do
        monster = "Goblin"
        healthEnemy = 8
        damage = 5
        enemy = Monster.new
        enemy.addMonster(monster, healthEnemy, damage)
        expect(enemy.getEnemyHealth(monster)).to eq(healthEnemy)
    end
    it "Should be able to get the damage of the monster" do
        monster = "Goblin"
        healthEnemy = 8
        damage = 5
        enemy = Monster.new
        enemy.addMonster(monster, healthEnemy, damage)
        expect(enemy.getEnemyDamage(monster)).to eq(damage)
    end    
    it "should be able to add a monster" do
        monster = "Goblin"
        healthEnemy = 8
        damage = 5
        enemy = Monster.new
        enemy.addMonster(monster, healthEnemy, damage)
        expect(enemy.getMonster().length).to be(1)
    end
end