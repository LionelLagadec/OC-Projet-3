/*
 
 
*/


// MARK: - Game

class Game {
    var playerOne: Player
    var playerTwo: Player
    
    init(playerOne: Player, playerTwo: Player) {
        self.playerOne = playerOne
        self.playerTwo = playerTwo
    }
    
    var getPlayerOne: Player {
        return self.playerOne
    }
    
    var getPlayerTwo: Player {
        return self.playerTwo
    }
}

// MARK: - Player

class Player {
    var characterOne: Character
    var characterTwo: Character
    var characterThree: Character
    
    init(characterOne: Character, characterTwo: Character, characterThree: Character) {
        self.characterOne = characterOne
        self.characterTwo = characterTwo
        self.characterThree = characterThree
    }
    
    var getCharacterOne: Character {
        return self.characterOne
    }

    var getCharacterTwo: Character {
        return self.characterTwo
    }
    
    var getCharacterThree: Character {
        return self.characterThree
    }
}
    
// MARK: - Character

class Character {
    var name: String
    var names: [String] = []
    var type: String
    var lifePoint: Int
    var weapon: Weapon
    
    init(name: String, type: String, lifePoint: Int, weapon: Weapon) {
        self.name = name
        self.type = type
        self.lifePoint = lifePoint
        self.weapon = weapon
    }
    
    func createName() {
        for name in names {
            names.append(name)
        }
    }
}
    
class Warrior: Character {
    var warrior = Warrior(name: "", type: "Warrior", lifePoint: 80, weapon: Sword())
    
    func attack() {
    }
}

class Knight: Character {
    var knight = Knight(name: "", type: "Knight", lifePoint: 100, weapon: Hacher())
    
    func attack() {
    }
}

class Doctor: Character {
    var doctor = Doctor(name: "", type: "Doctor", lifePoint: 50, weapon: Pad())
    
    func treat() {
    }
}

// MARK: - Weapon

class Weapon {
    var weaponName: String
    var removeLifePoint: Int
    var addLifePoint: Int
    
    init(weaponName: String, removeLifePoint: Int, addLifePoint: Int) {
        self.weaponName = weaponName
        self.removeLifePoint = removeLifePoint
        self.addLifePoint = addLifePoint
    }
}

class Sword: Weapon {
    init() {
        super.init(weaponName: "Sword", removeLifePoint: 20, addLifePoint: 0)
    }
}

class Hacher: Weapon {
    init() {
        super.init(weaponName: "Hacher", removeLifePoint: 40, addLifePoint: 0)
    }
}

class Pad: Weapon {
    init() {
        super.init(weaponName: "Pad", removeLifePoint: 0, addLifePoint: 15)
    }
}
