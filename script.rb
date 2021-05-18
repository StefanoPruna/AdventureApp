# require "tty-prompt"
# require "tty-spinner"
# require "artii"

#require_relative "adventureApp"

# @prompt = TTY::Prompt.new

def choice
    goblin = 8
    health = 10
    strength = 5
    puts "You are at the local tavern at Basian Angeles, in the valley of Gloomhaven. While at the bar drinking your pint of pale,"
    puts "the owner, an old man with a long beard called Loske, noticed you"
    puts "and asked as per your clothing, it seems like you are adventur seeking a new job."
    puts "You noted in agreement and he tells you that some villagers have been kidnapped by a black Elf called Viscid Snake,"
    puts "who lives at the old tower just outside of the village."

    puts "You accepted the request and start to walk to the tower to save the villagers"

    puts "Once inside of the tower, you have a fork, where do you go? Left, Right"
    playerChoice = gets.chomp
    while (goblin <= 0 || health <= 0) do
        if playerChoice == "Left" || playerChoice == "left"
            puts "A Goblin is approaching you, he is in attack mode!"
            puts "What do you do? Fight or Run?"
            playerSecondChoice = gets.chomp
            if playerSecondChoice == "Fight" || playerSecondChoice == "fight"
                dice = (rand() * 15).to_i
                if dice >= 9
                    goblin -= strength
                    if goblin <= 0
                        puts "You survive to the Goblin. Now where do you want to go? Up, Down, or go Back?"
                    end
                else
                    strength -= 5
                end
            else
                dice = (rand() * 20).to_i
                    if dice >= strength
                        health -= 5
                        puts "The Goblin was able to catch you while you were running, you get 5 point damage!"
                    else
                        puts "You manage to run without any damage!"
                    end
            end
        else
            puts "A Goblin is approaching you, he is in attack mode!"
            puts "What do you do? Fight or Run?"
            playerSecondChoice = gets.chomp
            if playerSecondChoice == "Fight" || playerSecondChoice == "fight"
                dice = (rand() * 15).to_i
                if dice >= 9
                    goblin -= strength
                else
                    strength -= 5
                end
            else
                dice = (rand() * 20).to_i
                    if dice >= strength
                        health -= 5
                        puts "The Goblin was able to catch you while you were running, you get 5 point damage!"
                    else
                        puts "You manage to run without any damage!"
                    end
            end
        end
    end
end

choice