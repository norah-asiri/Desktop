import UIKit

struct Card{
    let color : String
    let roll : Int

}

class Deck {
    var cards : [Card] = [Card]()

    func deal()-> Card{
        let temp_index : Int = Int.random(in: 0...cards.count-1)
        var top_most = cards.remove(at: temp_index)
    return top_most
    }
    
    func isEmpty() -> Bool {
        if (cards.isEmpty){
            return true
        }
        return false
    }
    
    func shuffle(){
        for i in 0..<cards.count-1 {
            let random_index1 = Int.random(in: 0...cards.count-1)
            let random_index2 = Int.random(in: 0...cards.count-1)
            let temp = cards[random_index1]
            cards[random_index1] = cards[random_index2]
            cards[random_index2] = temp
        }
        print("_________Card after shffle: _________")
        print(cards)
    }
    
    
    init(){
        for i in 0...29{
            if (i < 10){
                cards.append(Card(color: "Red", roll: Int.random(in: 1...2)))
                
            } else if (i >= 10 && i < 20 ){
                cards.append(Card(color: "Blue", roll: Int.random(in: 3...4)))
            
            } else {
                cards.append(Card(color: "Green", roll: Int.random(in: 4...6)))
                
            }
                
        }
        print("_________Cards init: _________")
        print(cards)
    }
}

class Player {
    var name : String
    var hand : Card
    var count : Int
    
    func draw () -> Card {
        let deck = Deck()
        self.hand = deck.deal()
        return hand
    
    }
    
    func rollDice () -> Int{
        return Int.random(in: 1...6)
    }
    
    func matchingCards (color : String, roll : Int) -> Int{
     return count+1
        }
    
    init (name : String){
        self.name = name
        print ("Hello \(name)")
        hand = Card(color: "", roll: 0)
        count = 0
    }
}
let player1 = Player(name: "Norah")
player1.draw()
print(player1.hand)
let roll = player1.rollDice()
let matching = player1.matchingCards(color: "Red", roll: roll)
print("Maching Cards = \(matching)")

let player2 = player1
player2.name = "test"
print("Here player1 name \(player1.name)")



// deck.shuffle()
// print("After shuffle \(deck.cards)")
// deck.deal()
// print(" After deal \(deck.cards)")





//let redCard = Card(color: "Red", roll: Int.random(in: 1...2))
//let blueCard = Card(color: "Blue", roll: Int.random(in: 3...4))
//let greenCard = Card(color: "Green", roll: Int.random(in: 4...6))
