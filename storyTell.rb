#Welcome to the Fantasy Adventure!
class InvalidZeroError < StandardError
end

system "clear"

inventory = {:coins => 0, :potion => 0}

Enemy = {Goblin: [healthEnemy=8, damage=5], 
          Skeleton: [healthEnemy=6, damage=4], 
          CosmicChest: [healthEnemy=4, damage=4], 
          Orc: [healthEnemy=6, damage=7], 
          ViscidSnake: [healthEnemy=10, damage=10]
        }

#The start of the game, choose the character name and the class
puts "Welcome to the Fantasy Adventure!!!! Insert the name of your character:"
playerName = gets.chomp
isClassRight = false
while (isClassRight == false) do
    puts "Hello #{playerName}, choose your class (Ninja: health=20, strength=6; Warrior: Health=10, strength=12; Wizard: health=14, strength=8):"
    playerClass = gets.chomp
    if playerClass == "Ninja" || playerClass == "ninja"
        classAttribute = {:health => 20, :strength => 6}
        isClassRight = true
    elsif playerClass == "Warrior" || playerClass == "warrior"
        classAttribute = {:health => 10, :strength => 10}
        isClassRight = true
    elsif playerClass == "Wizard" || playerClass == "wizard"
        classAttribute = {:health => 14, :strength => 8}
        isClassRight = true
    else
        puts "Sorry, but the #{playerClass} class will be available in the sequel...when I will make it!"
    end
end
puts "Nice choice #{playerName}, you look scary for a #{playerClass}!!, I hope you are ready for the adventure!"

#First part of the story
def partOne(health, strength, coins, potion)
    zone = "zoneOne"
    while (true) do
        puts "Once inside of the tower, you have a fork, where do you go? Left, Right"
                playerChoice = gets.chomp
                if playerChoice == "Left" || playerChoice == "left"
                    puts "A Goblin is approaching you, he is in attack mode!"
                    puts "What do you do? Fight or Run?"
                    playerSecondChoice = gets.chomp
                    if playerSecondChoice == "Fight" || playerSecondChoice == "fight"
                        fightGoblin(health, strength, coins, potion)
                        break
                    elsif playerSecondChoice == "Run" || playerSecondChoice == "run"
                        runFromMonster(health, strength, coins, potion, "zoneOne")
                        break
                    else #If player doesn't choose neither run nor fight
                        puts "You can only fight or run..."
                    end
                elsif playerChoice == "Right" || playerChoice == "right" #chose to go right
                    puts "A Goblin is approaching you, he is in attack mode!"
                    puts "What do you do? Fight or Run?"
                    playerSecondChoice = gets.chomp
                    if playerSecondChoice == "Fight" || playerSecondChoice == "fight"
                        fightGoblin(health, strength, coins, potion)
                        break
                    elsif playerSecondChoice == "Run" || playerSecondChoice == "run"
                        runFromMonster(health, strength, coins, potion, "zoneOne")
                        break
                    else #If player doesn't choose neither run nor fight
                        puts "You can only fight or run..."
                    end
                else #If player doesn't choose neither of the directions
                    puts "You chose the wrong path, try again!"
                end                   
    end
end

#Continue of the story
def partTwo(health, strength, coins, potion)
    zone = "zoneTwo"   
    #drinkPotion(health, strength, coins, potion, "zoneTwo")        
    while (true) do
        puts "Now you can keep going to the dungeoun. You encounter another intersection now, where do you want to go? Up, Down, or go Back?"
                playerChoice = gets.chomp
                if playerChoice == "Up" || playerChoice == "up"
                    puts "A Goblin is approaching you, he is in attack mode!"
                    puts "What do you do? Fight or Run?"
                    playerSecondChoice = gets.chomp
                    if playerSecondChoice == "Fight" || playerSecondChoice == "fight"
                        fightGoblin(health, strength, coins, potion)
                        break
                    elsif playerSecondChoice == "Run" || playerSecondChoice == "run"
                        runFromMonster(health, strength, coins, potion, "zoneTwo")
                        break
                    else #If player doesn't choose neither run nor fight
                        puts "You can only fight or run..."
                    end
                elsif playerChoice == "Down" || playerChoice == "down" #chose to go down to the dangeoun
                    puts "A Goblin is approaching you, he is in attack mode!"
                    puts "What do you do? Fight or Run?"
                    playerSecondChoice = gets.chomp
                    if playerSecondChoice == "Fight" || playerSecondChoice == "fight"
                        fightGoblin(health, strength, coins, potion)
                        break
                    elsif playerSecondChoice == "Run" || playerSecondChoice == "run"
                        runFromMonster(health, strength, coins, potion, "zoneTwo")
                        break
                    end
                elsif playerChoice == "Back" || playerChoice == "back" #If player doesn't choose neither run nor fight
                    puts "You choose to go back to the previous path"
                    partOne(health, strength, coins, potion)    
                else #If player doesn't choose neither of the directions
                    puts "You chose the wrong path, try again!"
                end                   
    end
end

#This function is called when the story is still going during a fight, drinking potion etc...
def keepGoing(health, strength, coins, potion, zone)
    case zone
    when "zoneOne"
        partOne(health, strength, coins, potion)
    when "zoneTwo"
        partTwo(health, strength, coins, potion)
    when "zoneThree"
        pass
    when "zoneFour"
        pass
    end
end

#This function is called when the player dies
def youDie(health, strength, coins, potion, zone)
    case zone
    when "zoneOne"
        partOne(health, strength, coins, potion)
    when "zoneTwo"
        partTwo(health, strength, coins, potion)
    when "zoneThree"
        pass
    when "zoneFour"
        pass
    end
end

#This function is called after the end of the battle
def drinkPotion(health, strength, coins, potion, zone)
    if potion > 0
        drink = false
        while (drink == false) do
            puts "Your health is: #{health}; would you like to drink the potion of health? Yes / No"
            drinkChoice = gets.chomp
            if drinkChoice == "yes" || drinkChoice == "Yes"
                health += 4
                potion -= 1
                puts "Your health now is #{health} and you have #{potion} potion/s"
                keepGoing(health, strength, coins, potion, zone)
                #drink = true
                break
            elsif drinkChoice == "no" || drinkChoice == "NO"
                puts "Ok, let's keep going with the adventure!"
                keepGoing(health, strength, coins, potion, zone)
                #drink = true
                break
            else
                puts "Do you want to drink the potion?"
            end
            drink = true
        end
    else
        puts "Sorry, but you don't have any potion...good luck!"
        keepGoing(health, strength, coins, potion, zone)
    end  
end

#This function is called when the player wants to exit the adventure
def exitTheGame
    puts "Ok, Thank you for coming, have a nice day!I'm going to make a coffee..."
    begin
        exit!
    rescue SystemExit
    end
end

#This function is called when the player chooses to fight the Goblins!
def fightGoblin(health, strength, coins, potion)
    #fightAgain = false
    puts "You choose to fight, great choice! Let's see how you go!"
    while (true) do
        # throw a dice to check if the player catches the monster 1 out of 15
        dice = (rand() * 15).to_i
        puts "Your attack is: #{dice}"
        #if the random number is equal or higher than 9, then the goblin reduced his health equal the strength of the player
        if dice >= 9
            Enemy[:Goblin][0] -= strength
            puts "You attacked the Goblin sucessfully and damage #{strength} to him!"
            if Enemy[:Goblin][0] <= 0 #the monster dies if reaches 0 or less
                puts "You survive the battle with the Goblin!. Here is a potion of health +4 and 10 Gold coins!!"
                coins += 10
                potion += 1
                puts "Your health is: #{health}, you have #{coins} coins and #{potion} potion/s"
                partTwo(health, strength, coins, potion)
            end
        #if the dice is less than 9, the player will get damaged - the monster's damage
        else
            health -= 5
            puts "You missed the Goblin and the Goblin managed to hit you! your health is #{health}"
            if potion > 0 && health > 0
                drink = false
                while (drink == false) do
                    puts "Your health is: #{health}; would you like to drink the potion of health? Yes / No"
                    drinkChoice = gets.chomp
                    if drinkChoice == "yes" || drinkChoice == "Yes"
                        health += 4
                        potion -= 1
                        puts "Your health now is #{health} and you have #{potion} potion/s"
                        drink = true
                        break
                    else
                        puts "Ok, let's keep fighting then!"
                        drink = true
                        break
                    end
                end                
            end
                if health <= 0
                    puts "I'm so sorry to tell you, but you are basically, how do I say...YOU ARE DEAD!!!"
                    puts "Would you like to try again? Yes / No"
                    playerFinish = gets.chomp
                    if playerFinish == "No" || playerFinish == "no"
                        exitTheGame
                    else
                        health += 6
                        partOne(health, strength, coins, potion)
                    end
                end
        end
    end
end

#This function is called when the player chooses to run!
def runFromMonster(health, strength, coins, potion, zone)
    puts "You choose to run?!?! really..."
    dice = (rand() * 20).to_i
    puts "The Monster is trying to attack you while you run! His attack is: #{dice}"
    if dice >= strength
        health -= 5
        puts "The Monster was able to catch you while you were running, you get 5 point damages!"
        puts "Your health is: #{health}"
        if health <= 0
            puts "I'm so sorry to tell you, but you are basically, how do I say...YOU ARE DEAD!!!"
            puts "Would you like to try again? Yes / No"
            playerFinish = gets.chomp
            if playerFinish == "No" || playerFinish == "no"
                exitTheGame
            else
                health += 6
                youDie(zone)
            end
        else
            drinkPotion(health, strength, coins, potion, zone)
        end
    else
        puts "However, you manage to run without receive any damages!"
        partOne(health, strength, coins, potion)
    end
end

#Start of the story, the beginning
puts "You are at the local tavern at Basian Angeles, in the valley of Gloomhaven. While at the bar drinking your pint of pale,"
puts "the owner, an old man with a long beard called Loske, noticed you"
puts "and asked as per your clothing, it seems like you are adventur seeking a new job."
puts "You noted in agreement and he tells you that some villagers have been kidnapped by a black Elf called Viscid Snake,"
puts "who lives at the old tower just outside of the village."
            
puts "Will you help us to save our villagers?(Yes / No)"
finish = gets.chomp
if finish == "Yes" || finish == "yes"
    puts "You accepted the request and start to walk to the tower to save the villagers"
    partOne(classAttribute[:health], classAttribute[:strength], inventory[:coins], inventory[:potion])
else
    exitTheGame
end
