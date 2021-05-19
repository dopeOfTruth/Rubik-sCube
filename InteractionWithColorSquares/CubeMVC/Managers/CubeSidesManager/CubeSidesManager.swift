//
//  SquaersManager.swift
//  InteractionWithColorSquares
//
//  Created by Михаил Красильник on 12.02.2021.
//

import UIKit

class CubeSidesManager {
    
    var redSideColors =  [
        CubeColors.redSide.color, CubeColors.redSide.color, CubeColors.redSide.color,
        CubeColors.redSide.color, CubeColors.redSide.color, CubeColors.redSide.color,
        CubeColors.redSide.color, CubeColors.redSide.color, CubeColors.redSide.color
    ]
    
    var orangeSideColors = [
        CubeColors.orangeSide.color, CubeColors.orangeSide.color, CubeColors.orangeSide.color,
        CubeColors.orangeSide.color, CubeColors.orangeSide.color, CubeColors.orangeSide.color,
        CubeColors.orangeSide.color, CubeColors.orangeSide.color, CubeColors.orangeSide.color
    ]
    
    var greenSideColors = [
        CubeColors.greenSide.color, CubeColors.greenSide.color, CubeColors.greenSide.color,
        CubeColors.greenSide.color, CubeColors.greenSide.color, CubeColors.greenSide.color,
        CubeColors.greenSide.color, CubeColors.greenSide.color, CubeColors.greenSide.color
    ]
        
    var blueSideColors = [
        CubeColors.blueSide.color, CubeColors.blueSide.color, CubeColors.blueSide.color,
        CubeColors.blueSide.color, CubeColors.blueSide.color, CubeColors.blueSide.color,
        CubeColors.blueSide.color, CubeColors.blueSide.color, CubeColors.blueSide.color
    ]
    
    var whiteSideColors = [
        CubeColors.whiteSide.color, CubeColors.whiteSide.color, CubeColors.whiteSide.color,
        CubeColors.whiteSide.color, CubeColors.whiteSide.color, CubeColors.whiteSide.color,
        CubeColors.whiteSide.color, CubeColors.whiteSide.color, CubeColors.whiteSide.color
    ]
    
    var yellowSideColors = [
        CubeColors.yellowSide.color, CubeColors.yellowSide.color, CubeColors.yellowSide.color,
        CubeColors.yellowSide.color, CubeColors.yellowSide.color, CubeColors.yellowSide.color,
        CubeColors.yellowSide.color, CubeColors.yellowSide.color, CubeColors.yellowSide.color
    ]
    
    lazy var sides = [redSideColors, orangeSideColors, greenSideColors, blueSideColors, whiteSideColors, yellowSideColors]
    
    //MARK: - Methods
    
    func turnTheCube(withPredicate: String, cube: inout CubeSides, squares: inout [UIView]){
        if withPredicate == "up" {
            let intermediateValue = cube.forward
            
            cube.forward = cube.top
            cube.top = cube.back
            cube.back = cube.bottom
            cube.bottom = intermediateValue
            
        } else if withPredicate == "down" {
            let intermediateValue = cube.forward
            
            cube.forward = cube.bottom
            cube.bottom = cube.back
            cube.back = cube.top
            cube.top = intermediateValue
            
        } else if withPredicate == "left" {
            let intermediateValue = cube.forward
            
            cube.forward = cube.left
            cube.left = cube.back
            cube.back = cube.right
            cube.right = intermediateValue
            
        } else if withPredicate == "right" {
            let intermediateValue = cube.forward
            
            cube.forward = cube.right
            cube.right = cube.back
            cube.back = cube.left
            cube.left = intermediateValue
        }
    
        paintMainCube(squares: &squares, colorNumber: cube.forward)
    }
    
    func paintMainCube(squares: inout [UIView], colorNumber: Int) {
                for (square, color) in zip(squares, sides[colorNumber]) {
                    square.backgroundColor = color
                }
    }
    
    func changePositionOfSides(_ cube: inout CubeSides, index: Int) {
        
        switch index {
        case cube.forward: break
        case cube.back:
            var intermediateValue = cube.forward
            cube.forward = cube.back
            cube.back = intermediateValue
            intermediateValue = cube.left
            cube.left = cube.right
            cube.right = intermediateValue
        case cube.left:
            let intermediateValue = cube.forward
            cube.forward = cube.left
            cube.left = cube.back
            cube.back = cube.right
            cube.right = intermediateValue
        case cube.right:
            let intermediateValue = cube.forward
            cube.forward = cube.right
            cube.right = cube.back
            cube.back = cube.left
            cube.left = intermediateValue
        case cube.top:
            let intermediateValue = cube.forward
            cube.forward = cube.top
            cube.top = cube.back
            cube.back = cube.bottom
            cube.bottom = intermediateValue
        case cube.bottom:
            let intermediateValue = cube.forward
            cube.forward = cube.bottom
            cube.bottom = cube.back
            cube.back = cube.top
            cube.top = intermediateValue
        default: break
        }
    }
    
    func getSidesName(_ nameSides: inout [UILabel]?, cube: CubeSides) {
        
        nameSides?[cube.forward].text = "Forward"
        nameSides?[cube.back].text = "Back"
        nameSides?[cube.top].text = "Top"
        nameSides?[cube.bottom].text = "Bottom"
        nameSides?[cube.left].text = "Left"
        nameSides?[cube.right].text = "Right"
    }
    
    
    //MARK: - Turn Methods
    func turnLeftSideUp(_ cube: CubeSides) {
        
        var one = sides[cube.forward].remove(at: 0)
        var two = sides[cube.forward].remove(at: 2)
        var three = sides[cube.forward].remove(at: 4)
        
        var four = sides[cube.top].remove(at: 0)
        sides[cube.top].insert(one, at: 0)
        var five = sides[cube.top].remove(at: 3)
        sides[cube.top].insert(two, at: 3)
        var six = sides[cube.top].remove(at: 6)
        sides[cube.top].insert(three, at: 6)
        
        one = sides[cube.back].remove(at: 0)
        sides[cube.back].insert(four, at: 0)
        two = sides[cube.back].remove(at: 3)
        sides[cube.back].insert(five, at: 3)
        three = sides[cube.back].remove(at: 6)
        sides[cube.back].insert(six, at: 6)
        
        four = sides[cube.bottom].remove(at: 0)
        sides[cube.bottom].insert(one, at: 0)
        five = sides[cube.bottom].remove(at: 3)
        sides[cube.bottom].insert(two, at: 3)
        six = sides[cube.bottom].remove(at: 6)
        sides[cube.bottom].insert(three, at: 6)
        
        sides[cube.forward].insert(four, at: 0)
        sides[cube.forward].insert(five, at: 3)
        sides[cube.forward].insert(six, at: 6)
        
        one = sides[cube.left].remove(at: 0)
        two = sides[cube.left].remove(at: 0)
        three = sides[cube.left].remove(at: 0)
        four = sides[cube.left].remove(at: 0)
        five = sides[cube.left].remove(at: 0)
        six = sides[cube.left].remove(at: 0)
        let seven = sides[cube.left].remove(at: 0)
        let eight = sides[cube.left].remove(at: 0)
        let nine = sides[cube.left].remove(at: 0)
        
        sides[cube.left].append(three)
        sides[cube.left].append(six)
        sides[cube.left].append(nine)
        sides[cube.left].append(two)
        sides[cube.left].append(five)
        sides[cube.left].append(eight)
        sides[cube.left].append(one)
        sides[cube.left].append(four)
        sides[cube.left].append(seven)
        
    }
    
    func turnLeftSideDown(_ cube: CubeSides) {
        
        var one = sides[cube.forward].remove(at: 0)
        var two = sides[cube.forward].remove(at: 2)
        var three = sides[cube.forward].remove(at: 4)
        
        var four = sides[cube.bottom].remove(at: 0)
        sides[cube.bottom].insert(one, at: 0)
        var five = sides[cube.bottom].remove(at: 3)
        sides[cube.bottom].insert(two, at: 3)
        var six = sides[cube.bottom].remove(at: 6)
        sides[cube.bottom].insert(three, at: 6)
        
        one = sides[cube.back].remove(at: 0)
        sides[cube.back].insert(four, at: 0)
        two = sides[cube.back].remove(at: 3)
        sides[cube.back].insert(five, at: 3)
        three = sides[cube.back].remove(at: 6)
        sides[cube.back].insert(six, at: 6)

        four = sides[cube.top].remove(at: 0)
        sides[cube.top].insert(one, at: 0)
        five = sides[cube.top].remove(at: 3)
        sides[cube.top].insert(two, at: 3)
        six = sides[cube.top].remove(at: 6)
        sides[cube.top].insert(three, at: 6)
        
        sides[cube.forward].insert(four, at: 0)
        sides[cube.forward].insert(five, at: 3)
        sides[cube.forward].insert(six, at: 6)
        
        one = sides[cube.left].remove(at: 0)
        two = sides[cube.left].remove(at: 0)
        three = sides[cube.left].remove(at: 0)
        four = sides[cube.left].remove(at: 0)
        five = sides[cube.left].remove(at: 0)
        six = sides[cube.left].remove(at: 0)
        let seven = sides[cube.left].remove(at: 0)
        let eight = sides[cube.left].remove(at: 0)
        let nine = sides[cube.left].remove(at: 0)
        
        sides[cube.left].append(seven)
        sides[cube.left].append(four)
        sides[cube.left].append(one)
        sides[cube.left].append(eight)
        sides[cube.left].append(five)
        sides[cube.left].append(two)
        sides[cube.left].append(nine)
        sides[cube.left].append(six)
        sides[cube.left].append(three)
    }
    
    func turnRightSideUp(_ cube: CubeSides) {
        
        var one = sides[cube.forward].remove(at: 2)
        var two = sides[cube.forward].remove(at: 4)
        var three = sides[cube.forward].remove(at: 6)
        
        var four = sides[cube.top].remove(at: 2)
        sides[cube.top].insert(one, at: 2)
        var five = sides[cube.top].remove(at: 5)
        sides[cube.top].insert(two, at: 5)
        var six = sides[cube.top].remove(at: 8)
        sides[cube.top].insert(three, at: 8)
        
        one = sides[cube.back].remove(at: 2)
        sides[cube.back].insert(four, at: 2)
        two = sides[cube.back].remove(at: 5)
        sides[cube.back].insert(five, at: 5)
        three = sides[cube.back].remove(at: 8)
        sides[cube.back].insert(six, at: 8)
        
        four = sides[cube.bottom].remove(at: 2)
        sides[cube.bottom].insert(one, at: 2)
        five = sides[cube.bottom].remove(at: 5)
        sides[cube.bottom].insert(two, at: 5)
        six = sides[cube.bottom].remove(at: 8)
        sides[cube.bottom].insert(three, at: 8)
        
        sides[cube.forward].insert(four, at: 2)
        sides[cube.forward].insert(five, at: 5)
        sides[cube.forward].insert(six, at: 8)
        
        one = sides[cube.right].remove(at: 0)
        two = sides[cube.right].remove(at: 0)
        three = sides[cube.right].remove(at: 0)
        four = sides[cube.right].remove(at: 0)
        five = sides[cube.right].remove(at: 0)
        six = sides[cube.right].remove(at: 0)
        let seven = sides[cube.right].remove(at: 0)
        let eight = sides[cube.right].remove(at: 0)
        let nine = sides[cube.right].remove(at: 0)
        
        sides[cube.right].append(seven)
        sides[cube.right].append(four)
        sides[cube.right].append(one)
        sides[cube.right].append(eight)
        sides[cube.right].append(five)
        sides[cube.right].append(two)
        sides[cube.right].append(nine)
        sides[cube.right].append(six)
        sides[cube.right].append(three)
    }
    
    func turnRightSideDown(_ cube: CubeSides) {
        
        var one = sides[cube.forward].remove(at: 2)
        var two = sides[cube.forward].remove(at: 4)
        var three = sides[cube.forward].remove(at: 6)
        
        var four = sides[cube.bottom].remove(at: 2)
        sides[cube.bottom].insert(one, at: 2)
        var five = sides[cube.bottom].remove(at: 5)
        sides[cube.bottom].insert(two, at: 5)
        var six = sides[cube.bottom].remove(at: 8)
        sides[cube.bottom].insert(three, at: 8)
        
        one = sides[cube.back].remove(at: 2)
        sides[cube.back].insert(four, at: 2)
        two = sides[cube.back].remove(at: 5)
        sides[cube.back].insert(five, at: 5)
        three = sides[cube.back].remove(at: 8)
        sides[cube.back].insert(six, at: 8)
        
        four = sides[cube.top].remove(at: 2)
        sides[cube.top].insert(one, at: 2)
        five = sides[cube.top].remove(at: 5)
        sides[cube.top].insert(two, at: 5)
        six = sides[cube.top].remove(at: 8)
        sides[cube.top].insert(three, at: 8)
        
        sides[cube.forward].insert(four, at: 2)
        sides[cube.forward].insert(five, at: 5)
        sides[cube.forward].insert(six, at: 8)
        
        one = sides[cube.right].remove(at: 0)
        two = sides[cube.right].remove(at: 0)
        three = sides[cube.right].remove(at: 0)
        four = sides[cube.right].remove(at: 0)
        five = sides[cube.right].remove(at: 0)
        six = sides[cube.right].remove(at: 0)
        let seven = sides[cube.right].remove(at: 0)
        let eight = sides[cube.right].remove(at: 0)
        let nine = sides[cube.right].remove(at: 0)
        
        sides[cube.right].append(three)
        sides[cube.right].append(six)
        sides[cube.right].append(nine)
        sides[cube.right].append(two)
        sides[cube.right].append(five)
        sides[cube.right].append(eight)
        sides[cube.right].append(one)
        sides[cube.right].append(four)
        sides[cube.right].append(seven)
    }
    
    func turnTopSideToRight(_ cube: CubeSides) {
        
        var one = sides[cube.forward].remove(at: 0)
        var two = sides[cube.forward].remove(at: 0)
        var three = sides[cube.forward].remove(at: 0)
        
        var four = sides[cube.right].remove(at: 0)
        sides[cube.right].insert(one, at: 0)
        var five = sides[cube.right].remove(at: 1)
        sides[cube.right].insert(two, at: 1)
        var six = sides[cube.right].remove(at: 2)
        sides[cube.right].insert(three, at: 2)
        
        one = sides[cube.back].remove(at: 0)
        sides[cube.back].insert(four, at: 0)
        two = sides[cube.back].remove(at: 1)
        sides[cube.back].insert(five, at: 1)
        three = sides[cube.back].remove(at: 2)
        sides[cube.back].insert(six, at: 2)
        
        four = sides[cube.left].remove(at: 0)
        sides[cube.left].insert(one, at: 0)
        five = sides[cube.left].remove(at: 1)
        sides[cube.left].insert(two, at: 1)
        six = sides[cube.left].remove(at: 2)
        sides[cube.left].insert(three, at: 2)
        
        sides[cube.forward].insert(four, at: 0)
        sides[cube.forward].insert(five, at: 1)
        sides[cube.forward].insert(six, at: 2)
        
        one = sides[cube.top].remove(at: 0)
        two = sides[cube.top].remove(at: 0)
        three = sides[cube.top].remove(at: 0)
        four = sides[cube.top].remove(at: 0)
        five = sides[cube.top].remove(at: 0)
        six = sides[cube.top].remove(at: 0)
        let seven = sides[cube.top].remove(at: 0)
        let eight = sides[cube.top].remove(at: 0)
        let nine = sides[cube.top].remove(at: 0)
        
        sides[cube.top].append(three)
        sides[cube.top].append(six)
        sides[cube.top].append(nine)
        sides[cube.top].append(two)
        sides[cube.top].append(five)
        sides[cube.top].append(eight)
        sides[cube.top].append(one)
        sides[cube.top].append(four)
        sides[cube.top].append(seven)
    }
    
    func turnTopSideToLeft(_ cube: CubeSides) {
        
        var one = sides[cube.forward].remove(at: 0)
        var two = sides[cube.forward].remove(at: 0)
        var three = sides[cube.forward].remove(at: 0)
        
        var four = sides[cube.left].remove(at: 0)
        sides[cube.left].insert(one, at: 0)
        var five = sides[cube.left].remove(at: 1)
        sides[cube.left].insert(two, at: 1)
        var six = sides[cube.left].remove(at: 2)
        sides[cube.left].insert(three, at: 2)
        
        one = sides[cube.back].remove(at: 0)
        sides[cube.back].insert(four, at: 0)
        two = sides[cube.back].remove(at: 1)
        sides[cube.back].insert(five, at: 1)
        three = sides[cube.back].remove(at: 2)
        sides[cube.back].insert(six, at: 2)
        
        four = sides[cube.right].remove(at: 0)
        sides[cube.right].insert(one, at: 0)
        five = sides[cube.right].remove(at: 1)
        sides[cube.right].insert(two, at: 1)
        six = sides[cube.right].remove(at: 2)
        sides[cube.right].insert(three, at: 2)
        
        sides[cube.forward].insert(four, at: 0)
        sides[cube.forward].insert(five, at: 1)
        sides[cube.forward].insert(six, at: 2)
        
        one = sides[cube.top].remove(at: 0)
        two = sides[cube.top].remove(at: 0)
        three = sides[cube.top].remove(at: 0)
        four = sides[cube.top].remove(at: 0)
        five = sides[cube.top].remove(at: 0)
        six = sides[cube.top].remove(at: 0)
        let seven = sides[cube.top].remove(at: 0)
        let eight = sides[cube.top].remove(at: 0)
        let nine = sides[cube.top].remove(at: 0)
        
        sides[cube.top].append(seven)
        sides[cube.top].append(four)
        sides[cube.top].append(one)
        sides[cube.top].append(eight)
        sides[cube.top].append(five)
        sides[cube.top].append(two)
        sides[cube.top].append(nine)
        sides[cube.top].append(six)
        sides[cube.top].append(three)
    }
    
    func turnBottomSideToLeft(_ cube: CubeSides) {
        
        var one = sides[cube.forward].remove(at: 6)
        var two = sides[cube.forward].remove(at: 6)
        var three = sides[cube.forward].remove(at: 6)
        
        var four = sides[cube.left].remove(at: 6)
        sides[cube.left].insert(one, at: 6)
        var five = sides[cube.left].remove(at: 7)
        sides[cube.left].insert(two, at: 7)
        var six = sides[cube.left].remove(at: 8)
        sides[cube.left].insert(three, at: 8)
        
        one = sides[cube.back].remove(at: 6)
        sides[cube.back].insert(four, at: 6)
        two = sides[cube.back].remove(at: 7)
        sides[cube.back].insert(five, at: 7)
        three = sides[cube.back].remove(at: 8)
        sides[cube.back].insert(six, at: 8)
        
        four = sides[cube.right].remove(at: 6)
        sides[cube.right].insert(one, at: 6)
        five = sides[cube.right].remove(at: 7)
        sides[cube.right].insert(two, at: 7)
        six = sides[cube.right].remove(at: 8)
        sides[cube.right].insert(three, at: 8)
        
        sides[cube.forward].insert(four, at: 6)
        sides[cube.forward].insert(five, at: 7)
        sides[cube.forward].insert(six, at: 8)
        
        one = sides[cube.bottom].remove(at: 0)
        two = sides[cube.bottom].remove(at: 0)
        three = sides[cube.bottom].remove(at: 0)
        four = sides[cube.bottom].remove(at: 0)
        five = sides[cube.bottom].remove(at: 0)
        six = sides[cube.bottom].remove(at: 0)
        let seven = sides[cube.bottom].remove(at: 0)
        let eight = sides[cube.bottom].remove(at: 0)
        let nine = sides[cube.bottom].remove(at: 0)
        
        sides[cube.bottom].append(seven)
        sides[cube.bottom].append(four)
        sides[cube.bottom].append(one)
        sides[cube.bottom].append(eight)
        sides[cube.bottom].append(five)
        sides[cube.bottom].append(two)
        sides[cube.bottom].append(nine)
        sides[cube.bottom].append(six)
        sides[cube.bottom].append(three)
    }
    
    func turnBottomSideToRight(_ cube: CubeSides) {
        
        var one = sides[cube.forward].remove(at: 6)
        var two = sides[cube.forward].remove(at: 6)
        var three = sides[cube.forward].remove(at: 6)
        
        var four = sides[cube.right].remove(at: 6)
        sides[cube.right].insert(one, at: 6)
        var five = sides[cube.right].remove(at: 7)
        sides[cube.right].insert(two, at: 7)
        var six = sides[cube.right].remove(at: 8)
        sides[cube.right].insert(three, at: 8)
        
        one = sides[cube.back].remove(at: 6)
        sides[cube.back].insert(four, at: 6)
        two = sides[cube.back].remove(at: 7)
        sides[cube.back].insert(five, at: 7)
        three = sides[cube.back].remove(at: 8)
        sides[cube.back].insert(six, at: 8)
        
        four = sides[cube.left].remove(at: 6)
        sides[cube.left].insert(one, at: 6)
        five = sides[cube.left].remove(at: 7)
        sides[cube.left].insert(two, at: 7)
        six = sides[cube.left].remove(at: 8)
        sides[cube.left].insert(three, at: 8)
        
        sides[cube.forward].insert(four, at: 6)
        sides[cube.forward].insert(five, at: 7)
        sides[cube.forward].insert(six, at: 8)
        
        one = sides[cube.bottom].remove(at: 0)
        two = sides[cube.bottom].remove(at: 0)
        three = sides[cube.bottom].remove(at: 0)
        four = sides[cube.bottom].remove(at: 0)
        five = sides[cube.bottom].remove(at: 0)
        six = sides[cube.bottom].remove(at: 0)
        let seven = sides[cube.bottom].remove(at: 0)
        let eight = sides[cube.bottom].remove(at: 0)
        let nine = sides[cube.bottom].remove(at: 0)
        
        sides[cube.bottom].append(three)
        sides[cube.bottom].append(six)
        sides[cube.bottom].append(nine)
        sides[cube.bottom].append(two)
        sides[cube.bottom].append(five)
        sides[cube.bottom].append(eight)
        sides[cube.bottom].append(one)
        sides[cube.bottom].append(four)
        sides[cube.bottom].append(seven)
    }
    
}
