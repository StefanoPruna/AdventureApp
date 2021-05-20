require_relative "./monsters"

class Monster
    def initialize
        @enemy = []
    end

    def addMonster(monster, health, damage)
        enemy = Enemies.new(monster, health, damage)
        @enemy << enemy
    end

    def getEnemyHealth(monster)
        enemyHealth = @enemy.find {|enemy| enemy.monster == monster}
        return enemyHealth.healthEnemy
    end

    def getEnemyDamage(monster)
        enemyDamage = @enemy.find {|enemy| enemy.monster == monster}
        return enemyDamage.damage
    end

    def getMonster
        return @enemy
    end
end