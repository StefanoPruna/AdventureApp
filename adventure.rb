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

