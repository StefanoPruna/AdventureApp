require_relative "./script"

# tell = Script.new("Fantasy Story", "Goblin", "Ninja", "Goblin")

# tell.welcome
health = 0
strength = 0
coins = 0
potion = 0
Enemy = {Goblin: [healthEnemy=8, damage=5], 
          Skeleton: [healthEnemy=6, damage=4], 
          CosmicChest: [healthEnemy=4, damage=4], 
          Orc: [healthEnemy=6, damage=7], 
          ViscidSnake: [healthEnemy=10, damage=10]
        }

#The start of the game, choose the character name and the class
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

#This function is called when the player wants to exit the adventure
def exitTheGame
    puts "Ok, Thank you for coming, have a nice day!I'm going to make a coffee..."
    begin
        exit!
    rescue SystemExit
    end
end

#This function is called when the player chooses to fight!
def fightGoblin(health, strength)
    coins = 0
    potion = 0
    while (true) do
        # throw a dice to check if the player catches the monster 1 out of 15
        dice = (rand() * 15).to_i
        puts "Your attack is: #{dice}"
        #if the random number is equal or higher than 9, then the goblin reduced his health equal the strength of the player
        if dice >= 9
            Enemy[:Goblin][0] -= strength
            puts "You attack the Goblin sucessfully and damage #{strength} to him!"
            if Enemy[:Goblin][0] <= 0 #the monster dies if reaches 0 or less
                puts "You survive the battle with the Goblin!. Here is a potion of health +4 and 10 Gold coins!!"
                coins += 10
                potion += 1
                puts "Your health is: #{health}"
                break
            end
        #if the dice is less than 9, the player will get damaged - the monster's damage
        else
            health -= 5
            puts "The Goblin managed to hit you! your health is #{health}"
            if health <= 0
                puts "I'm so sorry to tell you, but you are basically, how do I say...YOU ARE DEAD!!!"
                puts "Would you like to try again? Yes / No"
                playerFinish = gets.chomp
                if playerFinish == "No" || playerFinish == "no"
                    exitTheGame
                else
                    fightGoblin(strength, health)
                end
            end
        end
    end
end

#This function is called when the player chooses to run!
def runFromGoblin(strength)
    dice = (rand() * 20).to_i
    puts "Your attack is: #{dice}"
    if dice >= strength
        health -= 5
        puts "The Goblin was able to catch you while you were running, you get 5 point damage!"
        puts "Your health is: #{health}"
        if health <= 0
            puts "I'm so sorry to tell you, but you are basically, how do I say...YOU ARE DEAD!!!"
            puts "Would you like to try again? Yes / No"
            playerFinish = gets.chomp
            if playerFinish == "No" || playerFinish == "no"
                exitTheGame
            else
                fightGoblin(strength, health)
            end
        end
    else
        puts "You manage to run without any damage!"
    end
end

#Start of the story
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
    exitTheGame
end

while (true) do
    puts "Once inside of the tower, you have a fork, where do you go? Left, Right"
            playerChoice = gets.chomp
            if playerChoice == "Left" || playerChoice == "left"
                puts "A Goblin is approaching you, he is in attack mode!"
                puts "What do you do? Fight or Run?"
                playerSecondChoice = gets.chomp
                if playerSecondChoice == "Fight" || playerSecondChoice == "fight"
                    fightGoblin(strength, health)
                else
                    runFromGoblin(strength)
                end
            elsif playerChoice == "Right" || playerChoice == "right" #chose to go right
                puts "A Goblin is approaching you, he is in attack mode!"
                puts "What do you do? Fight or Run?"
                playerSecondChoice = gets.chomp
                if playerSecondChoice == "Fight" || playerSecondChoice == "fight"
                    fightGoblin(strength, health)
                elsif playerSecondChoice == "Run" || playerSecondChoice == "run"
                    runFromGoblin(playerClass)
                else
                    puts "You chose the wrong path, try again!"
                end
            else
                puts "You chose the wrong path, try again!"
            end   
                puts "Your health is: #{health}; would you like to drink the potion of health? Yes / No"
                drinkChoice = gets.chomp
                if drinkChoice == "yes" || drinkChoice == "Yes"
                    health += 4
                    potion -= 1
                end
                break
end

#Continue of the story
puts "Now you can keep going to the dungeoun. You encounter another intersection now, where do you want to go? Up, Down, or go Back?"
            
    