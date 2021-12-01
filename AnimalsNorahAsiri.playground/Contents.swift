import UIKit
import Darwin

class Animal {
    var name: String
    var health = 100
    
    init (name1 : String){
    self.name = name1
    }

    func displayHealth (){
        print ("The health of \(name) = \(health)")}
}
//________________________________

class Cat : Animal  {
   // var catName : String = ""
    func growl (){
        print("Rawr!")
    }
    
    func run (){
        print ("Running")
        health -= 10
    }
    
    override init(name1: String){
    
        super.init(name1: name1)
        self.health = 150
    }
}

class Cheetah : Cat{
  //  let cheetahName : String = ""
//    override func growl() {
//        print("ROAR!!!! I am the King of the Jungle")
//    }
//
    override func run() {
        if (health > 0 ){
        print ("Running Fast")
        health -= 50
        } else{
            print ("I cant run more , my healh = \(health)")
        }
    }
    
    override init(name1: String){
        super.init(name1: name1)
        self.health = 200
    }
    
    func sleep () {
        if(health <= 150){
        super.health += 50
        }else{
            health = 200
        }
            
//            if (heath > 150 && heath < 200){
//            heath += (200 - heath)
//        }
//        else {
//            heath = 200
//        }
        
    }
    }

class Lion: Cat{
    //let lionCat : String
    
    override func growl() {
        print("ROAR!!!! I am the King of the Jungle")
    }
    
    override init(name1: String){
        super.init(name1: name1)
        self.health = 200
    }
}


let cheetah = Cheetah(name1: "Cheetah")
cheetah.run()
cheetah.run()
cheetah.run()
cheetah.run()
cheetah.displayHealth()

let lion = Lion (name1: "Lion")
lion.run()
lion.run()
lion.run()
lion.growl()

cheetah.run()
