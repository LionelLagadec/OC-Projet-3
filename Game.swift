/*
 
 
*/


// MARK: - Game

class Game {
    var players: [Player]
    
    init(players: [Player]) {
        self.players = players
    }
}


// MARK: - Player

class Player {
    var characters: [Character]
    
    init(characters: [Character]) {
        self.characters = characters
    }
}
   

// MARK: - Character

class Character {
    static var names: [String] = []
    var name: String
    var lifePoints: Int
    var health: Int
    var weapon: Weapon
    var isAlive: Bool
    
    init(name: String, lifePoints: Int, health: Int, weapon: Weapon) {
        self.name = name
        self.lifePoints = lifePoints
        self.health = health
        self.weapon = weapon
        self.isAlive = true
    }
}

    
class Warrior: Character {
    init(name:String) {
        super.init(name: name, lifePoints: 100, health: 10, weapon: Sword())
    }
}

class Magus: Character {
    init(name:String) {
        super.init(name: name, lifePoints: 200, health: 0, weapon: Knife())
    }
}

class Dwarf: Character {
    init(name:String) {
        super.init(name: name, lifePoints: 60, health: 30, weapon: Ax())
    }
}



// MARK: - Weapon

class Weapon {
    var weaponName: String
    var damage: Int
    
    init(weaponName: String, damage: Int) {
        self.weaponName = weaponName
        self.damage = damage
    }
}

class Sword: Weapon {
    init() {
        super.init(weaponName: "Sword", damage: 25)
    }
}

class Knife: Weapon {
    init() {
        super.init(weaponName: "Knife", damage: 15)
    }
}

class Ax: Weapon {
    init() {
        super.init(weaponName: "Ax", damage: 50)
    }
}


// MARK: - Create Players

func createPlayer() -> Player {
    
    var team = 0
    var characters: [Character] = []
    
    while(team < 3) {
        
        var characterNumber: String!
        var characterName: String!
        
        print("Please select a type for the character \(team + 1)")
        
        characterNumber = readLine()
            
            if(Int(characterNumber) == 1 || Int(characterNumber) == 2 || Int(characterNumber) == 3) {
                print("Please select a name for your character (The name must be unique)")
                
                characterName = readLine()
                    
                while(Character.names.contains(characterName) || characterName == "") {
                print("Please select a unique name for your character and can't be empty")
                    
                characterName = readLine()
                    
                }
                
                Character.names.append(characterName)
                
                switch Int(characterNumber) {
                case 1:
                    characters.append(Warrior(name: characterName))
                case 2:
                    characters.append(Magus(name: characterName))
                case 3:
                    characters.append(Dwarf(name: characterName))
                default:
                    break
                }
                
            team += 1
        }
    }
    return Player(characters: characters)
}


// MARK: - Get Recap

func getRecap() {

    var i = 1

    for player in players {
        print("\n")
        print("Player \(i) :")
        print("========================================================================================")

        for character in player.characters {
            print("Name: ", character.name, " / Life points: ", character.lifePoints, " / Health: ", character.health, " / Weapon: ", character.weapon.weaponName, " / Damage: ", character.weapon.damage)
        }

        print("========================================================================================")
        i += 1
    }
    print("\n")
}


// MARK: - Battle

func fight() {
    
}


// MARK: - Check Alive

func checkAlive() {

}


// MARK: - Create Game

print("""
\n
==============================================
||            FrenchGame Factory            ||
==============================================
\n
""")

var players: [Player] = []

for i in 1...2 {
    print("""
    Player \(i) : Please choose 3 characters in the following list"
    Enter 1, 2 or 3 to select the character"
    1 - Warrior : LifePoints: 100, Health: 10, Weapon: Sword, Damage: 15"
    2 - Magus : LifePoints: 200, Health: 0, Weapon: Knife, Damage: 25"
    3 - Dwarf : LifePoints: 60, Health: 30, Weapon: Ax, Damage: 50"
    """)
    players.append(createPlayer())
}

getRecap()
