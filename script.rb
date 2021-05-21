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

    def printScript
        puts "Insert your character name:"
        playerName = gets.chomp
        isClassRight = false
        while (isClassRight == false) do
            puts "Hello #{playerName}, choose your class (Ninja: health=20, strength=6; Warrior: Health=10, strength=12; Wizard: health=14, strength=8):"
            playerClass = gets.chomp
            if playerClass == "Ninja" || playerClass == "ninja"
                health = 20
                strength = 6
                isClassRight = true
            elsif playerClass == "Warrior" || playerClass == "warrior"
                health = 10
                strength = 6
                isClassRight = true
            elsif playerClass == "Wizard" || playerClass == "wizard"
                health = 14
                strength = 8
                isClassRight = true
            else
                puts "Sorry, but the #{playerClass} class will be available in the sequel...when I will make it!"    
            end
        end
        puts "Nice choice #{playerName}, you look scary for a #{playerClass}!!, I hope you are ready for the adventure!"

        def fightGoblin
            while (goblin <= 0 || health <= 0) do
                # throw a dice to check if the player catches the monster 1 out of 15
                dice = (rand() * 15).to_i
                #if the random number is equal or higher than 9, then the goblin reduced his health equal the strength of the player
                if dice >= 9
                    goblin -= strength
                    if goblin <= 0 #the monster dies if reaches 0 or less
                        puts "You survive the battle with the Goblin!. Here is a potion of health +4 and 10 coins!!"
                        coins += 10
                    end
                #if the dice is less than 9, the player will get damaged - the monster's damage
                else
                    health -= 5
                    if health <= 0
                        puts "I'm so sorry to tell you, but you are basically, how do I say...YOU ARE DEAD!!!"
                        puts "Would you like to try again? Yes / No"
                        playerFinish = gets.chomp
                        if playerFinish == "No" || playerFinish == "no"
                            begin
                                exit!
                            rescue SystemExit
                            end
                        else
                            fightGoblin
                        end
                    end
                end
            end
        end

        def runFromGoblin(playerClass)
            dice = (rand() * 20).to_i
            if dice >= strength
                health -= 5
                puts "The Goblin was able to catch you while you were running, you get 5 point damage!"
                if health <= 0
                    puts "I'm so sorry to tell you, but you are basically, how do I say...YOU ARE DEAD!!!"
                    puts "Would you like to try again? Yes / No"
                    playerFinish = gets.chomp
                    if playerFinish == "No" || playerFinish == "no"
                        begin
                            exit!
                        rescue SystemExit
                        end
                    else
                        fightGoblin
                    end
                end
            else
                puts "You manage to run without any damage!"
            end
        end
            #goblin = 8 # health = 8, damage = 5
            
            # health = 10
            # strength = 5
            puts "You are at the local tavern at Basian Angeles, in the valley of Gloomhaven. While at the bar drinking your pint of pale,"
            puts "the owner, an old man with a long beard called Loske, noticed you"
            puts "and asked as per your clothing, it seems like you are adventur seeking a new job."
            puts "You noted in agreement and he tells you that some villagers have been kidnapped by a black Elf called Viscid Snake,"
            puts "who lives at the old tower just outside of the village."
            
            puts "Will you help us to save our villagers?(Yes / No)"
            finish = gets.chomp
            if finish == "Yes" || finish == "yes"
                puts "You accepted the request and start to walk to the tower to save the villagers"
            else
                puts "Ok, Thank you for coming, have a nice day!I'm going to make a coffee..."
                begin
                    exit!
                rescue SystemExit
                end
            end

            puts "Once inside of the tower, you have a fork, where do you go? Left, Right"
            playerChoice = gets.chomp
            if playerChoice == "Left" || playerChoice == "left"
                puts "A Goblin is approaching you, he is in attack mode!"
                puts "What do you do? Fight or Run?"
                playerSecondChoice = gets.chomp
                if playerSecondChoice == "Fight" || playerSecondChoice == "fight"
                    fightGoblin
                else
                    runFromGoblin(playerClass)
                end
            else #chose to go right
                puts "A Goblin is approaching you, he is in attack mode!"
                puts "What do you do? Fight or Run?"
                playerSecondChoice = gets.chomp
                if playerSecondChoice == "Fight" || playerSecondChoice == "fight"
                    fightGoblin
                else
                    runFromGoblin(playerClass)
                end
            end   
                puts "Your health is: #{health}; would you like to drink the potion of health? Yes / No"
                drinkChoice = gets.chomp
                if drinkChoice == "yes" || drinkChoice == "Yes"
                    health += 4
                end

                puts "Now you can keep going to the dungeoun. You encounter another intersection now, where do you want to go? Up, Down, or go Back?"
    end
end

# title = "Fantasy Adventure"
# classesOption = {Ninja: [health=20, strength=6], Warrior: [Health=10, strength=12], Wizard: [health=14, strength=8]}
# story = Script.new(playerClass, monster, classes, enemy)
# story.welcome
# story.printScript