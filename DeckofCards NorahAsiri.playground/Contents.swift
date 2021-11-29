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
    }
}

class Player {
    let name : String
    let hand : Card
    func draw (deck : Deck) -> Card {
        
    }
    init (){
        
    }
}

let deck = Deck()
print(" Init \(deck.cards)")
deck.shuffle()
print("After shuffle \(deck.cards)")
deck.deal()
print(" After deal \(deck.cards)")





//let redCard = Card(color: "Red", roll: Int.random(in: 1...2))
//let blueCard = Card(color: "Blue", roll: Int.random(in: 3...4))
//let greenCard = Card(color: "Green", roll: Int.random(in: 4...6))
