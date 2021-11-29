import UIKit
import Darwin
import Foundation

struct Point {
    var x: Double
    var y : Double
}

struct Line {
    var start : Point
    var end : Point
    
    func Length() -> Double{
        var length = sqrt (pow((start.x - end.x),2) + pow((start.y - end.y),2))
        return length
    }

    init (start : Point , end : Point ){
        self.start = start
        self.end = end
    }
}

struct Triangle {
    // Here I pass the array to area calculater function
    func AreaCal(pointArr : [Point] ) {
        var temp_line : Line
        var lengths : [Double] = [Double]()
        var i = 0
        while i < pointArr.count-1 {
            temp_line = Line (start: pointArr[i] , end : pointArr[i+1])
            lengths.append(temp_line.Length())
            i = i+2
        }
        
        // ____________ fill 3 sides length _________________
        let s1 : Double = lengths[0]
        print( "Side 1 Legnth = \(s1)")
        let s2 : Double = lengths[1]
        print("Side 2 Legnth = \(s2)")
        let s3 : Double = lengths[2]
        print("Side 3 Legnth = \(s3)")
        let sub_sides = s1 + s2 + s3 // s1 , s2 , s3 -> Side
        
        // ____________ calculate semi_perimeter _________________
        let s = sub_sides / 2 // s-> semi_perimeter
        
        // ____________ calculate area _________________
        let area = sqrt(s*(s-s1)*(s-s2)*(s-s3))
        print("The area of tringle is \(area)")
        
    }
}

func sides (arr : [Double])-> [Point]{ // Create tow points (x , y)
    var temp_point : Point
    var points : [Point] = [Point]()
    var i = 0
    while i < 11 {
        temp_point = Point(x : arr[i] , y : arr[i+1])
        points.append(temp_point)
        i = i + 2}
    return points}


// I can replace sides function by send each line points , see the next line ->
//// ____________ Sides _________________
//
//// Side 1
//let startL1 = Point( x : -5 , y : 1)
//let endL1 = Point( x : 3 , y : -5)
//
//// Side 2
//let startL2 = Point( x : 3 , y : -5)
//let endL2 = Point( x : 5 , y : 2)
//
//// Side 3
//let startL3 = Point( x : 5 , y : 2)
//let endL3 = Point( x : -5 , y : 1)
//
//// ______________ Calling ______________
//var tringle = Triangle()
//var points : [Point] = [startL1 , endL1, startL2,endL2 , startL3,endL3]
//tringle.AreaCal(pointArr: points)

// when I want to test a sigle tringle this way is easy to pass points
// but for more one test , call func sides is shorter

// ______________ Calling ______________
// tringle1
let tringle = Triangle()
let allPoints : [Double] = [1,1,4,1,4,1,4,5,4,5,1,1]
let pointArr =  sides (arr: allPoints)
tringle.AreaCal(pointArr: pointArr )

//tringle2
let tringle2 = tringle
let allPoints2 : [Double] = [2,1,5,1,5,1,1,4,1,4,2,1]
let pointArr2 =  sides (arr: allPoints2)
tringle2.AreaCal(pointArr: pointArr2)

//tringle3
let tringle3 = tringle
let allPoints3 : [Double] = [-5,1,3,-5,3,-5,5,2,5,2,-5,1]
let pointArr3 =  sides (arr: allPoints3)
tringle3.AreaCal(pointArr: pointArr3)



