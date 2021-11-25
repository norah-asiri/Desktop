import UIKit

func Palindrome (world : String) -> Bool {
    var WorldLitter: [Character] = [Character]()
    var temp_index: Int
    var temp_world : String
    for ch in world {
        WorldLitter.append(ch)
    }

    if (WorldLitter.count==0 || WorldLitter.count==1){
        return true
    }
    
    if(WorldLitter[0] == WorldLitter[WorldLitter.count-1]){
        WorldLitter.remove(at: 0)
        temp_index=WorldLitter.count-1
        WorldLitter.remove(at:temp_index)
        temp_world = String(WorldLitter)
        return Palindrome(world:temp_world)
    }
    return false
}
var testWord = "wow"
var result = Palindrome (world: testWord)
print ("isPalindrome(\(testWord)) -> \(result)" )
