require "tty-prompt"
require "tty-spinner"
require "artii"

name = ARGV[0]

@prompt = TTY::Prompt.new

def startGame
    name = ARGV[0]
    puts "Welcome #{name} to the Adventure Game"
    logo = Artii::Base.new
    puts logo.asciify("adventureApp").red

    health=0
    strength=0
    player = @prompt.select("Hello #{name}, choose your class (Ninja: health=20, strength=6; Warrior: Health=10, strength=12; Wizard: health=14, strength=8):")

    if player == "Ninja"
        health = 20
        strength = 6
    elsif player == "Warrior"
        health = 10
        strength = 6
    else
        health = 14
        strength = 8
    end
end

startGame