#Welcome to the Fantasy Adventure! a RPG text game

#require ("tty-prompt")
#require ("ascii-image")
require ("colorize")

# def initialize(uri, console_width = 80) ⇒ ASCII_Image
# end

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

def startGame
    #The start of the game, choose the character name and the class
    puts "Welcome to the Fantasy Adventure!!!!".yellow.blink.bold
end

startGame #called the function to start the game in case the player wants to restart the game once finished it

#the beginning of the program
    puts "Insert the name of your character:".cyan.italic
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
                    puts "What do you do? Fight or Run?".cyan
                    playerSecondChoice = gets.chomp
                    if playerSecondChoice == "Fight" || playerSecondChoice == "fight"
                        fightGoblin(health, strength, coins, potion, zone)
                    elsif playerSecondChoice == "Run" || playerSecondChoice == "run"
                        runFromMonster(health, strength, coins, potion, zone)
                    else #If player doesn't choose neither run nor fight
                        puts "You can only fight or run...".light_red
                    end
                elsif playerChoice == "Right" || playerChoice == "right" #chose to go right
                    puts "A Goblin is approaching you, he is in attack mode!"
                    puts "What do you do? Fight or Run?".yellow
                    playerThirdChoice = gets.chomp
                    if playerThirdChoice == "Fight" || playerThirdChoice == "fight"
                        fightGoblin(health, strength, coins, potion, zone)
                    elsif playerThirdChoice == "Run" || playerThirdChoice == "run"
                        runFromMonster(health, strength, coins, potion, zone)
                    else #If player doesn't choose neither run nor fight
                        puts "You can only fight or run...".light_red
                    end
                else #If player doesn't choose neither of the directions
                    puts "You chose the wrong path, try again!".light_red
                end                   
    end
end

#Continue of the story
def partTwo(health, strength, coins, potion)
    zone = "zoneTwo"   
    #drinkPotion(health, strength, coins, potion, "zoneTwo") 
    system "clear"       
    while (true) do
        puts "Now you can keep going to the dungeoun. You encounter another intersection now, where do you want to go? Up, Down, or go Back?"
                playerChoice = gets.chomp
                if playerChoice == "Up" || playerChoice == "up"
                    puts "You chose to go upstairs to see if you can find the villagers."
                    puts "you have another interserction: You can go to a room on your right, or keep going forward."
                    puts "What do you do? Right, Forward or go back?".cyan.italic
                    playerThirdChoice = gets.chomp #Another intersection
                    if playerThirdChoice == "Right" || playerThirdChoice == "right"
                        puts "You chose to go to your right to investigate the room."
                        puts "Once inside, you find a chest!WOW, that's lucky!".bold.cyan
                        chest = false
                        while (chest == false) do
                            puts "Are you going to open the chest? Yes / No"
                            openChest = gets.chomp
                            if openChest == "Yes" || openChest == "yes"
                                puts "Of course you want to see what's inside! but unfortunately for you, it's empty!!!"
                                puts "Disappointed, you are about to leave the room when..."
                                puts "A cosmic creature from another dimension that can get any appearance, it attacks you in form of a chest!!!".light_red
                                fightChest(health, strength, coins, potion, zone)
                                chest = true
                            elsif openChest == "No" || openChest == "no"
                                puts "Disappointed, you are about to leave the room when..."
                                puts "A cosmic creature from another dimension that can get any appearance, it attacks you in form of a chest!!!".light_red
                                fightChest(health, strength, coins, potion, zone)
                                chest = true
                            else
                                puts "What would you like to do"   
                            end  
                        end                       
                    elsif playerThirdChoice == "Forward" || playerThirdChoice == "forward"        
                        partThree(health, strength, coins, potion)
                    elsif playerThirdChoice == "Back" || playerThirdChoice == "back"
                        puts "You choose to go back to the previous path".light_red
                        partTwo(health, strength, coins, potion)
                    else #If player doesn't choose neither run nor fight
                        puts "You can choose to go right in the room, keep going or go back...".light_red
                    end
                elsif playerChoice == "Down" || playerChoice == "down" #chose to go down to the dangeoun
                    puts "You decided to go down the steps and see where it brings you."
                    puts "Once down at the bottom of the stairs, it's darker, torches are slightly alighted for you to see..."
                    puts "You are in the basement and there are prisons!!!".light_magenta
                    puts "Unfortunately, no prisoners! The prisons are empty. You decide to leave the basement to look for the villager somewhere else."
                    puts "But...While you are leaving the prisons, a Skeleton is attacking you!!!".light_magenta
                    puts "What do you do? Fight or Run?"
                    playerSecondChoice = gets.chomp
                    if playerSecondChoice == "Fight" || playerSecondChoice == "fight"
                        fightSkeleton(health, strength, coins, potion, zone)
                        break
                    elsif playerSecondChoice == "Run" || playerSecondChoice == "run"
                        runFromMonster(health, strength, coins, potion, zone)
                        break
                    end
                elsif playerChoice == "Back" || playerChoice == "back" #If player doesn't choose neither run nor fight
                    puts "You choose to go back to the previous path".light_red
                    partOne(health, strength, coins, potion)    
                else #If player doesn't choose neither of the directions
                    puts "You chose the wrong path, try again!".light_red
                end                   
    end
end

#Continue of the story
def partThree(health, strength, coins, potion)
    zone = "zoneThree"   
    #drinkPotion(health, strength, coins, potion, "zoneTwo") 
    system "clear"   
    leftChoice = 0    
    while (true) do
        puts "Now you can keep going to the dungeoun. You encounter another intersection now, where do you want to go? left, right, or go Back?"
        playerChoice = gets.chomp
        if playerChoice == "Left" || playerChoice == "left"
            case leftChoice
            when leftChoice = 0  #check whether the player has already been in this room or not
                puts "You chose to go to your left, hopefully you will find the villagers."
                puts "You find yourself in another small room, it's full of books everywhere with a desk with notes and papers all over."
                puts "You know what, it looks like you have reached the Black Elf's private room!!!".bold.light_black
                puts "Searching through it, you find a potion of Strength + 2, but nothing else, unfortunately."
                strength += 2
                puts "You drink the potion and your strength now is #{strength}."
                puts "There is not any other choice, but leave the room."
                leftChoice += 1 #now the player has been in this room
            when leftChoice = 1 #The second time the player will choose to go left:     
                puts "You are back to Viscid Sname's room, maybe you will find something important this time?!".italic.cyan
                puts "Since there are so many books on the shelves, you are thinking 'There must be a secret door if I move a book certainly...'"
                puts "You decide to start to move all the books like they were sort of a lever and guess what?"
                puts "One of the shelf is opening before you!".yellow.bold
                partFour(health, strength, coins, potion)
            end
        elsif playerChoice == "Right" || playerChoice == "right" #chose to go to the right
            puts "You decided to the right and find yourself in the kitchen."
            puts "There is a big figure busy cooking going left and right on the floor and suddenly it looks at you"
            puts "You look each other for a short moment and then..."
            puts "The orc start screaming and running towards you to start the attack!".cyan
            puts "What do you do? Fight or Run?"
            playerSecondChoice = gets.chomp
            if playerSecondChoice == "Fight" || playerSecondChoice == "fight"
                fightOrc(health, strength, coins, potion, zone)
                break
            elsif playerSecondChoice == "Run" || playerSecondChoice == "run"
                runFromMonster(health, strength, coins, potion, zone)
                break
            end
        elsif playerChoice == "Back" || playerChoice == "back" #If player doesn't choose neither run nor fight
            puts "You choose to go back to the previous path".light_red
            partTwo(health, strength, coins, potion)    
        else #If player doesn't choose neither of the directions
            puts "You chose the wrong path, try again!".light_red
        end                   
    end
end

def partFour(health, strength, coins, potion)
    zone = "zoneFour"   
    #drinkPotion(health, strength, coins, potion, "zoneTwo") 
    system "clear" 
    rightChoice = 1
    rightChoice -= 1     
    while (true) do
        puts "You go through the small and narrow secret corridor. Where would it lead you?"
        puts "Finally you exit the passage and encounter an intersection, where do you want to go? Right toward a room, forward, or go Back(for real? Back now?)"
        playerChoice = gets.chomp
        if playerChoice == "Right" || playerChoice == "right"
            case rightChoice
            when rightChoice < 0    
                puts "You are curious to go to the room and even this time it was a good choice!"
                puts "You find a potion of fire!".red
                strength += 3
                puts "Now when you attack, you also throw fire! Your strength is #{strength} now!".light_red
                puts "You inspected the room thoroughly and you are sure there is nothing else in here. You go back to the previous intersection."
                rightChoice += 2
            when rightChoice > 1
                puts "You are back in the room, however, yes, you find nothing...(I told you)".bold.italic.light_blue
            end
                puts "where do you want to go? Forward, or go Back?"
                playerSecondChoice = gets.chomp #Another intersection
                if playerSecondChoice == "Forward" || playerSecondChoice == "forward"
                    partFive(health, strength, coins, potion)
                elsif playerSecondChoice == "Back" || playerSecondChoice == "back"
                    puts "You choose to go back to the previous path"
                    rightChoice += 5
                    partFour(health, strength, coins, potion)            
                else
                    puts "What would you like to do"   
                end  
        elsif playerChoice == "Forward" || playerChoice == "forward"
            partFive(health, strength, coins, potion)
        elsif playerChoice == "Back" || playerChoice == "back"
            puts "You choose to go back to the previous path"
            partThree(health, strength, coins, potion)
        else #If player doesn't choose neither options
            puts "You can choose to go right in the room, keep going or go back...".light_magenta
        end
    end
end

#This is the final part
def partFive(health, strength, coins, potion)
    zone = "zoneFive"   
    #drinkPotion(health, strength, coins, potion, "zoneTwo") 
    system "clear"
    puts "Finally you have arrived to the final room! the fight to save the villagers has arrived!"
    puts "Before you stands Viscid Snake, the Black Elf and he is laughing at you:"
    puts "You will die!!!".red.bold.italic
    puts "Are you ready for the fight? Yes, Let's finish it! / No, let's go back for a moment..."
    while (true) do
        if playerChoice == "Fight" || playerChoice == "fight"
            fightBoss(health, strength, coins, potion, zone)
        elsif playerChoice == "Back" || playerChoice == "back"
            puts "You choose to go back to the previous path"
            partFour(health, strength, coins, potion)            
        else
            puts "What would you like to do"   
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
        partThree(health, strength, coins, potion)
    when "zoneFour"
        partFour(health, strength, coins, potion)
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
        partThree(health, strength, coins, potion)
    when "zoneFour"
        partFour(health, strength, coins, potion)
    when "zoneFive"
        partFive(health, strength, coins, potion)
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
                drink = true
                break
            elsif drinkChoice == "no" || drinkChoice == "NO"
                puts "Ok, let's keep going with the adventure!"
                keepGoing(health, strength, coins, potion, zone)
                drink = true
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
    puts "Ok, Thank you for coming, have a nice day!I'm going to make a coffee...".green
    begin
        exit!
    rescue SystemExit
    end
end

#This function is called when the player chooses to fight the Goblins!
def fightGoblin(health, strength, coins, potion, zone)
    fightAgain = false
    #ascii = ASCII_Image.new("Goblin.jpg")
    #ascii.build(80)
    puts "You choose to fight, great choice! Let's see how you go!"
    while (Enemy[:Goblin][0] > 0 || health > 0) do
        # throw a dice to check if the player catches the monster 1 out of 15
        dice = (rand() * 15).to_i
        puts "Your attack is: #{dice}"
        #if the random number is equal or higher than 9, then the goblin reduced his health equal the strength of the player
        if dice >= 5
            Enemy[:Goblin][0] -= strength
            puts "You attacked the Goblin sucessfully and damage #{strength} to him!"
            if Enemy[:Goblin][0] <= 0 #the monster dies if reaches 0 or less
                puts "You survive the battle with the Goblin!. Here is a potion of health +4 and 10 Gold coins!!".green
                coins += 10
                potion += 1
                puts "Your health is: #{health}, you have #{coins} coins and #{potion} potion/s"
                drinkPotion(health, strength, coins, potion, "zoneTwo")
            end
        #if the dice is less than 9, the player will get damaged - the monster's damage
        else
            health -= 5
            puts "You missed the Goblin and the Goblin managed to hit you! your health is #{health}".light_red
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
                    puts "I'm so sorry to tell you, but you are basically, how do I say...YOU ARE DEAD!!!".red
                    puts "Would you like to try again? Yes / No"
                    playerFinish = gets.chomp
                    if playerFinish == "No" || playerFinish == "no"
                        exitTheGame
                    else
                        health += 10
                        youDie(health, strength, coins, potion, zone)
                    end
                end  
        end
    end
end

#This function is called when the player chooses to fight the Skeleton!
def fightSkeleton(health, strength, coins, potion, zone)
    #fightAgain = false
    puts "You choose to fight, great choice! Let's see how you go!".light_blue
    while (true) do
        # throw a dice to check if the player catches the monster 1 out of 15
        dice = (rand() * 15).to_i
        puts "Your attack is: #{dice}"
        #if the random number is equal or higher than 9, then the goblin reduced his health equal the strength of the player
        if dice >= 5
            Enemy[:Skeleton][0] -= strength
            puts "You attacked the Skeleton sucessfully and damage #{strength} to him!"
            if Enemy[:Skeleton][0] <= 0 #the monster dies if reaches 0 or less
                puts "You survive the battle with the Skeleton!. Here is a potion of health +4 and 10 Gold coins!!".green
                coins += 10
                potion += 1
                puts "Your health is: #{health}, you have #{coins} coins and #{potion} potion/s"
                drinkPotion(health, strength, coins, potion, "zoneThree")
            end
        #if the dice is less than 9, the player will get damaged - the monster's damage
        else
            health -= 4
            puts "You missed the Skeleton and the Skeleton managed to hit you! your health is #{health}".light_red
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
                    puts "I'm so sorry to tell you, but you are basically, how do I say...YOU ARE DEAD!!!".red
                    puts "Would you like to try again? Yes / No"
                    playerFinish = gets.chomp
                    if playerFinish == "No" || playerFinish == "no"
                        exitTheGame
                    else
                        health += 10
                        youDie(health, strength, coins, potion, zone)
                    end
                end
        end
    end
end

#This function is called when the player chooses to fight the Cosmic Chest!
def fightChest(health, strength, coins, potion, zone)
    #fightAgain = false
    puts "You choose to fight, great choice! Let's see how you go!".light_blue
    while (true) do
        # throw a dice to check if the player catches the monster 1 out of 15
        dice = (rand() * 15).to_i
        puts "Your attack is: #{dice}"
        #if the random number is equal or higher than 9, then the goblin reduced his health equal the strength of the player
        if dice >= 5
            Enemy[:CosmicChest][0] -= strength
            puts "You attacked the Cosmic Chest sucessfully and damage #{strength} to him!"
            if Enemy[:CosmicChest][0] <= 0 #the monster dies if reaches 0 or less
                puts "You survive the battle with the Cosmic Chest!. Here is a potion of health +4 and 10 Gold coins!!".green
                coins += 10
                potion += 1
                puts "Your health is: #{health}, you have #{coins} coins and #{potion} potion/s"
                drinkPotion(health, strength, coins, potion, "zoneThree")
            end
        #if the dice is less than 9, the player will get damaged - the monster's damage
        else
            health -= 4
            puts "You missed the Cosmic Chest and the Cosmic Chest managed to hit you! your health is #{health}".light_red
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
                    puts "I'm so sorry to tell you, but you are basically, how do I say...YOU ARE DEAD!!!".red
                    puts "Would you like to try again? Yes / No"
                    playerFinish = gets.chomp
                    if playerFinish == "No" || playerFinish == "no"
                        exitTheGame
                    else
                        health += 10
                        youDie(health, strength, coins, potion, zone)
                    end
                end
        end
    end
end

def fightOrc(health, strength, coins, potion, zone)
    #fightAgain = false
    puts "You choose to fight, great choice! Let's see how you go!"
    orcDeath = false
    while (orcDeath == false) do
        # throw a dice to check if the player catches the monster 1 out of 15
        dice = (rand() * 15).to_i
        puts "Your attack is: #{dice}"
        #if the random number is equal or higher than 9, then the goblin reduced his health equal the strength of the player
        if dice >= 7
            Enemy[:Orc][0] -= strength
            puts "You attacked the Orc sucessfully and damage #{strength} to him!"
            if Enemy[:Orc][0] <= 0 #the monster dies if reaches 0 or less
                puts "You survive the battle with the Orc!. Here is a potion of health +4 and 10 Gold coins!!".green
                coins += 10
                potion += 1
                puts "Your health is: #{health}, you have #{coins} coins and #{potion} potion/s"
                orcDeath = true
                drinkPotion(health, strength, coins, potion, "zoneFour")
            end
        #if the dice is less than 9, the player will get damaged - the monster's damage
        else
            health -= 6
            puts "You missed the Orc and the Orc managed to hit you! your health is #{health}".light_red
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
                    puts "I'm so sorry to tell you, but you are basically, how do I say...YOU ARE DEAD!!!".red
                    puts "Would you like to try again? Yes / No"
                    playerFinish = gets.chomp
                    if playerFinish == "No" || playerFinish == "no"
                        exitTheGame
                    else
                        health += 10
                        youDie(health, strength, coins, potion, zone)
                    end
                end
        end
        if orcDeath == true
            partFour(health, strength, coins, potion)
        end
    end
end

def fightBoss(health, strength, coins, potion, zone)
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
                puts "You survive the battle with the Goblin!. Here is a potion of health +4 and 10 Gold coins!!".green
                coins += 10
                potion += 1
                puts "Your health is: #{health}, you have #{coins} coins and #{potion} potion/s"
                #partTwo(health, strength, coins, potion)
                keepGoing(health, strength, coins, potion, zone)
            end
        #if the dice is less than 9, the player will get damaged - the monster's damage
        else
            health -= 5
            puts "You missed the Goblin and the Goblin managed to hit you! your health is #{health}".light_red
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
                    puts "I'm so sorry to tell you, but you are basically, how do I say...YOU ARE DEAD!!!".red
                    puts "Would you like to try again? Yes / No"
                    playerFinish = gets.chomp
                    if playerFinish == "No" || playerFinish == "no"
                        exitTheGame
                    else
                        health += 10
                        youDie(health, strength, coins, potion, zone)
                    end
                end
        end
    end
end

#This function is called at the very end, when the player beat the final boss!
def finalAct
    puts "You finally beat the final boss!!! You saved the villagers and bring back to the village!".bold.italic.light_blue
    puts "Everybody is thanking you!!! You are a hero now!".bold.italic.light_green
    puts "What now? What would you do next? Your adventure is just started...(as soon as I do another adventure, sure...)"
    theEnd = false
    while (theEnd == false)
        puts "Would you like to exit the game or start again from the beginning? Start / End"
        finalChoice = gets.chomp
        if finalChoice == "End" || finalChoice == "end"
            exitTheGame
            theEnd = true
        elsif finalChoice == "Start" || finalChoice == "start"
            startGame()
            theEnd = true
        else
            puts "Wrong asnwer, sorry"
        end
    end        
end

#This function is called when the player chooses to run!
def runFromMonster(health, strength, coins, potion, zone)
    puts "You choose to run?!?! really...".magenta
    dice = (rand() * 20).to_i
    puts "The Monster is trying to attack you while you run! His attack is: #{dice}"
    if dice >= strength
        health -= 5
        puts "The Monster was able to catch you while you were running, you get 5 point damages!".light_red
        puts "Your health is: #{health}"
        if health <= 0
            puts "I'm so sorry to tell you, but you are basically, how do I say...YOU ARE DEAD!!!".red
            puts "Would you like to try again? Yes / No"
            playerFinish = gets.chomp
            if playerFinish == "No" || playerFinish == "no"
                exitTheGame
            else
                health += 10
                youDie(health, strength, coins, potion, zone)
            end
        else
            drinkPotion(health, strength, coins, potion, zone)
        end
    else
        puts "However, you manage to run without receive any damages!"
        keepGoing(health, strength, coins, potion, zone)
    end
end

#startGame
#The beginning of the story
puts "You are at the local tavern at Basian Angeles, in the valley of Gloomhaven. While at the bar drinking your pint of pale,"
    puts "the owner, an old man with a long beard called Loske, noticed you"
    puts "and asked as per your clothing, it seems like you are adventur seeking a new job."
    puts "You noted in agreement and he tells you that some villagers have been kidnapped by a black Elf called Viscid Snake,"
    puts "who lives at the old tower just outside of the village."
                
    finished = false
    while (finished == false) do
        puts "Will you help us to save our villagers?(Yes / No)".light_blue
        finish = gets.chomp
        if finish == "Yes" || finish == "yes"
            puts "You accepted the request and start to walk to the tower to save the villagers"
            partOne(classAttribute[:health], classAttribute[:strength], inventory[:coins], inventory[:potion])
            finished = true
        elsif (finish == "No" || finish == "no")
            exitTheGame
            finished = true
        else
            puts "I know it can be a big decision, but you can save the them, we believe in you!".green
        end
    end
