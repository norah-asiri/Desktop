import UIKit

// 1- Create a function tossCoin() ->  String. Have this function print "Tossing a Coin!". Next have the function randomly pick either "Heads" or "Tails" .Have the function print the result .Finally, have the function return the result

func tossCoin () -> String{
   print ("Tossing a Coin!")
    let CoinArr = ["Heads","Tails"]
    let result = CoinArr[Int.random(in: 0...1)]
return result
}

//2- Now create another function tossMultipleCoins(Int) -> Double. Have this function call the tossCoin function multiple times based on the Integer input. Have the function return a Double that reflects the ratio of head toss to total toss

func tossMultipleCoins(num : Int) -> Double {
    if (num>0){
        var ratio : Double = 0
        var headToss :Double = 0
        for _ in 1...num{
        if(tossCoin()=="Heads"){
            headToss += 1
    }
    }
        ratio = (headToss/Double(num))
        return ratio
    }else {
        print ("The number must be greater than 0")
    }
    
return 0}



print (tossMultipleCoins(num : 5))
print (tossMultipleCoins(num : 0))
print (tossMultipleCoins(num : 1))
print (tossMultipleCoins(num : -1))
print (tossMultipleCoins(num : 10))




