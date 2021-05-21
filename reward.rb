class Rewards
    def initialize
        @rewardItem = Hash.new(0)
    end

    def addItem(name, quantity)
        @rewardItem[name] += quantity
    end

    def addPotion(name, quantityPotion)
        @rewardItem[name] += quantityPotion
    end

    def takeItem(name, quantityPotion)
        @rewardItem[name] -= quantityPotion
    end

    def getItem
        return @rewardItem
    end

    def getPtion
        return @rewardItem
    end
end