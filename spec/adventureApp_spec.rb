# require "tty-prompt"
# require "tty-spinner"
# require "artii"

require_relative "../script"
require_relative "../enemy"
require_relative "../monsters"
require_relative "../classes"
require_relative "../players"
require_relative "../reward"

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

describe Rewards do
    it "Should update the coins quantity" do
        reward = Rewards.new
        name = "coins"
        quantity = 1
        quantityAdded = 10
        reward.addItem(name, quantity)
        reward.addItem(name, quantityAdded)
        expect(reward.getItem()[name]).to be(quantity+quantityAdded)
    end
    it "should update the potions when used" do
        reward = Rewards.new
        name = "potion"
        quantityPotion = 1
        potionAdded = 1
        reward.addPotion(name, quantityPotion)
        reward.addPotion(name, potionAdded)
        expect(reward.getPtion()[name]).to be(quantityPotion+potionAdded)
    end
    # it "should update the potions when used" do
    #     reward = Rewards.new
    #     name = "potion"
    #     quantityPotion = quantityPotion
    #     potionReduced = 1
    #     reward.takeItem(name, quantityPotion)
    #     reward.takeItem(name, potionReduced)
    #     expect(reward.getPtion()[name]).to be(quantityPotion-potionReduced)
    # end
end

describe Script do
    it "Should print a welcome method" do
        title = "Fantasy Adventure"
        classAvailable = {Ninja: [health=20, strength=6], Warrior: [health=10, strength=12], Wizard: [health=14, strength=8]}
        monsters = {}
        monsterAvailable = {Goblin: [healthEnemy=8, damage=5], Skeleton: [healthEnemy=6, damage=4], CosmicChest: [healthEnemy=4, damage=4], Orc: [healthEnemy=6, damage=7], ViscidSnake: [healthEnemy=10, damage=10]}
        story = Script.new(title, classAvailable, monsterAvailable, monsters)
        expect(story.welcome).to eq(nil)
    end
    it "Should update the reward items" do
        title = "Fantasy Adventure"
        classAvailable = {Ninja: [health=20, strength=6], Warrior: [health=10, strength=12], Wizard: [health=14, strength=8]}
        monsters = {}
        monsterAvailable = {Goblin: [healthEnemy=8, damage=5], Skeleton: [healthEnemy=6, damage=4], CosmicChest: [healthEnemy=4, damage=4], Orc: [healthEnemy=6, damage=7], ViscidSnake: [healthEnemy=10, damage=10]}
        story = Script.new(title, classAvailable, monsterAvailable, monsters)
        item = "coins"
        quantity = 1
        story.addToInventory(item, quantity)
        expect(story.getReward().getItem.length).to be(1)
    end
    it "Should print the story" do
        title = "Fantasy Adventure"
        classAvailable = {Ninja: [health=20, strength=6], Warrior: [health=10, strength=12], Wizard: [health=14, strength=8]}
        monsters = {}
        monsterAvailable = {Goblin: [healthEnemy=8, damage=5], Skeleton: [healthEnemy=6, damage=4], CosmicChest: [healthEnemy=4, damage=4], Orc: [healthEnemy=6, damage=7], ViscidSnake: [healthEnemy=10, damage=10]}
        story = Script.new(title, classAvailable, monsterAvailable, monsters)
        expect(story.printScript()).to eq(nil)
    end
end