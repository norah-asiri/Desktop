import UIKit

var list_number: [Int] = []

//Write a program that appends the numbers 1-255 to an array

for i in 1...255 {
    list_number.append(i)
}

//Using that same array swap two random values in the array
let random_index1 = Int.random(in: 1...255)-1
let random_index2 = Int.random(in: 1...255)-1
let temp = list_number[random_index1]
list_number[random_index1] = list_number[random_index2]
list_number[random_index2] = temp

//Now write the code that swaps random values 100 times (You've created a "Shuffle"!)
func random_genrator (){
    let random_index1 = Int.random(in: 1...255)-1
    let random_index2 = Int.random(in: 1...255)-1
    let temp = list_number[random_index1]
    list_number[random_index1] = list_number[random_index2]
    list_number[random_index2] = temp
}
for _ in 0..<100 { // bz we dont need use i if we declear it.
    random_genrator ()
}

//Remove the value "42" from the array and Print "We found the answer to the Ultimate Question of Life, the Universe, and Everything at index __" and print the index of where "42" was before you removed it.
for i in 0..<list_number.count{
    if (list_number[i]==42){
        print("We found the answer to the Ultimate Question of Life, the Universe, and Everything at index \(i)")
        list_number.remove(at: i)
        break
    }
}
