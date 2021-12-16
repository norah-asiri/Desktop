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

// ____________Length_________________

//// Line1 length
//let line1 = Line(start : startL1 , end: endL1)
//
//// Line2 length
//let line2 = Line(start : startL2 , end: endL2)
//
//// Line3 length
//let line3 = Line(start : startL3 , end: endL3)
//

struct Triangle {
    
    func AreaCal(pointArr : [Point] ) {
        var temp_line : Line
        var lengths : [Double] = [Double]()
        var i = 0
        while i < pointArr.count-1 {
            temp_line = Line (start: pointArr[i] , end : pointArr[i+1])
            lengths.append(temp_line.Length())
            i = i+2
        }
        
        // ____________ fill 3 sides _________________
        let s1 : Double = lengths[0]
        print(s1)
        let s2 : Double = lengths[1]
        print(s2)
        let s3 : Double = lengths[2]
        print(s3)
        let sub_sides = s1 + s2 + s3 // s1 , s2 , s3 -> Side
        
        // ____________ calculate semi_perimeter _________________
        let s = sub_sides / 2 // s-> semi_perimeter
        
        // ____________ calculate area _________________
        let area = sqrt(s*(s-s1)*(s-s2)*(s-s3))
        print("The area of tringle is \(area)")
    
}
}
// ____________ Sides _________________
//
//// Side 1
//let startL1 = Point( x : 1 , y : 1)
//let endL1 = Point( x : 3 , y : 1)
//
//// Side 2
//let startL2 = Point( x : 3 , y : 1)
//let endL2 = Point( x : 3 , y : 3)
//
//// Side 3
//let startL3 = Point( x : 3 , y : 3)
//let endL3 = Point( x : 3 , y : 1)

func sides (arr : [Double])-> [Point]{
    var temp_point : Point
    var points : [Point] = [Point]()
    var i = 0
    while i < 11 {
        temp_point = Point(x : arr[i] , y : arr[i+1])
        points.append(temp_point)
       i = i + 2}
    return points}

// ______________ Calling ______________
let tringle = Triangle()

//var points : [Point] = [startL1 , endL1, startL2,endL2 , startL3,endL3]
//tringle.AreaCal(pointArr: points)
let allPoints : [Double] = [1,1,4,1,4,1,4,5,4,5,1,1]
let pointArr =  sides (arr: allPoints)
tringle.AreaCal(pointArr: pointArr )
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
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
