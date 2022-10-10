/*
 Mission: Create a prototype of a battle game for an iOS application.
 The game is played with 2 players who must each choose 3 characters to compose their team and then fight against each other.
 Characters will have predefined types, and each of these types will have unique characteristics.
 The characteristics of a character type are the points of life and a weapon.
 Each character has a unique name.
 The game is over when all the characters of a team are dead.
 */


// MARK: - Game

class Game {
    var players: [Player]
    
    init(players: [Player]) {
        self.players = players
    }
    
    func getPlayer(index: Int) -> Player {
        return self.players[index]
    }
}


// MARK: - Player

class Player {
    var characters: [Character]
    
    init(characters: [Character]) {
        self.characters = characters
    }
    
    func getCharacter(index: Int) -> Character {
        return self.characters[index - 1]
    }
}


// MARK: - Character

class Character {
    static var names: [String] = []
    var name: String
    var lifePoints: Int
    var health: Int
    var weapon: Weapon
    var isAlive: Bool = true
    
    init(name: String, lifePoints: Int, health: Int, weapon: Weapon) {
        self.name = name
        self.lifePoints = lifePoints
        self.health = health
        self.weapon = weapon
    }
    
    func killCharacter() {
        self.isAlive = false
    }
    
    func removeLifePoints(points: Int) {
        self.lifePoints = self.lifePoints - points < 0 ? 0 : self.lifePoints - points
    }
    
    func addLifePoints(points: Int) {
        self.lifePoints = self.lifePoints + points
    }
}


class Warrior: Character {
    init(name: String) {
        super.init(name: name, lifePoints: 100, health: 10, weapon: Sword())
    }
}

class Magus: Character {
    init(name: String) {
        super.init(name: name, lifePoints: 200, health: 0, weapon: Knife())
    }
}

class Dwarf: Character {
    init(name: String) {
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
            print("Please choose a name for your character (The name must be unique)")
            
            characterName = readLine()
            
            while(Character.names.contains(characterName) || characterName == "") {
                print("Please choose a unique name for your character and can't be empty")
                
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

func fight(player: Int) {
    
    var playerOne: Int = 0
    var playerTwo: Int = 1
    
    if(player == 1) {
        playerOne = 1
        playerTwo = 0
    }
    
    var characterNumberPlayerOne: String!
    var characterNumberPlayerTwo: String!
    var action: String!
    
    print("Player \(player + 1) please select a character - Enter 1, 2 or 3")
    characterNumberPlayerOne = readLine()
    
    while(Int(characterNumberPlayerOne) != 1 && Int(characterNumberPlayerOne) != 2 && Int(characterNumberPlayerOne) != 3
          || game.getPlayer(index:playerOne).getCharacter(index:Int(characterNumberPlayerOne) ?? 0).isAlive == false) {
        print("Player \(player + 1)  please select a character - Enter 1, 2 or 3")
        characterNumberPlayerOne = readLine()
    }
    
    if(game.getPlayer(index:playerOne).getCharacter(index:Int(characterNumberPlayerOne) ?? 0).health != 0) {
        
        print("Please select an action: Health or Attack")
        print("For Health tap 1")
        print("For Attack tap 2")
        action = readLine()
        
        while(Int(action) != 1 && Int(action) != 2) {
            print("For Health tap 1")
            print("For Attack tap 2")
            action = readLine()
        }
        
        if(Int(action) == 1) {
            print("Which character do you want to health ?  - Enter 1, 2 or 3")
            
            var characterToHealth: String!
            
            characterToHealth = readLine()
            
            while(Int(characterToHealth) != 1 && Int(characterToHealth) != 2 && Int(characterToHealth) != 3
                  || game.getPlayer(index:playerOne).getCharacter(index:Int(characterToHealth) ?? 0).isAlive == false) {
                print("Player \(player + 1)  please select a character - Enter 1, 2 or 3")
                characterToHealth = readLine()
            }
            
            game.getPlayer(index:playerOne).getCharacter(index:Int(characterToHealth) ?? 0).addLifePoints(points:game.getPlayer(index:playerOne).getCharacter(index:Int(characterNumberPlayerOne) ?? 0).health)
            getRecap()
            return
        }
    }
    
    print("Which character do you want to attack ? - Enter 1, 2 or 3")
    characterNumberPlayerTwo = readLine()
    
    while(Int(characterNumberPlayerTwo) != 1 && Int(characterNumberPlayerTwo) != 2 && Int(characterNumberPlayerTwo) != 3
          || game.getPlayer(index:playerTwo).getCharacter(index:Int(characterNumberPlayerTwo) ?? 0).isAlive == false) {
        print("Player \(player + 1)  please select a character to attack - Enter 1, 2 or 3")
        characterNumberPlayerTwo = readLine()
    }
    
    game.getPlayer(index:playerTwo).getCharacter(index:Int(characterNumberPlayerTwo) ?? 0).removeLifePoints(points:game.getPlayer(index:playerOne).getCharacter(index:Int(characterNumberPlayerOne) ?? 0).weapon.damage)
    
    if(game.getPlayer(index:playerTwo).getCharacter(index:Int(characterNumberPlayerTwo) ?? 0).lifePoints <= 0) {
        game.getPlayer(index:playerTwo).getCharacter(index:Int(characterNumberPlayerTwo) ?? 0).killCharacter()
    }
    
    getRecap()
}



// MARK: - Check Alive

func checkAlive(player: Int) -> Bool {
    
    var isAlive: [Bool] = []
    
    for character in game.getPlayer(index:player).characters {
        isAlive.append(character.isAlive)
    }
    
    if(isAlive.contains(true)) {
        return true
    }
    
    return false
}


// MARK: - Create Game

print("""
\n
====================================================
||        FrenchGame Factory - Battle Game        ||
====================================================
\n
""")

var players: [Player] = []

for i in 1...2 {
    print("""
    
    Player \(i): Please choose 3 characters in the following list:
    --------------------------------------------------------------------
    1 - Warrior: Life Points: 100, Health: 10, Weapon: Sword, Damage: 15
    2 - Magus: Life Points: 200, Health: 0, Weapon: Knife, Damage: 25
    3 - Dwarf: Life Points: 60, Health: 30, Weapon: Ax, Damage: 50
    --------------------------------------------------------------------
    Enter 1, 2 or 3 to select the character
    
    """)
    players.append(createPlayer())
}

var game = Game(players: players)
var counter: Int = 0
getRecap()

while(true) {
    
    fight(player: 0)
    
    if(checkAlive(player: 1) == false) {
        print("""
        ================================
        ||   Player 1 is the winner   ||
        ================================
        \(counter) rounds
        """)
        getRecap()
        break
    }
    
    fight(player:1)
    
    if(checkAlive(player: 0) == false) {
        print("""
        ================================
        ||   Player 2 is the winner   ||
        ================================
        \(counter) rounds
        """)
        getRecap()
        break
    }
    
    counter += 1
}
