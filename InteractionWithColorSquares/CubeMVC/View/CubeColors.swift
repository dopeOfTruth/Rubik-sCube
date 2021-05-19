//
//  CubRub.swift
//  InteractionWithColorSquares
//
//  Created by Михаил Красильник on 11.02.2021.
//

import UIKit

enum CubeColors: Int {
    case redSide = 0
    case orangeSide = 1
    case greenSide = 2
    case blueSide = 3
    case whiteSide = 4
    case yellowSide = 5
    
    
    var color: UIColor {
        switch self {
        case .redSide: return UIColor.red
        case .orangeSide: return UIColor.orange
        case .greenSide: return UIColor.green
        case .blueSide: return UIColor.blue
        case .whiteSide: return UIColor.white
        case .yellowSide: return UIColor.yellow
        }
    }
}


