//
//  CubRub.swift
//  InteractionWithColorSquares
//
//  Created by Михаил Красильник on 11.02.2021.
//

import UIKit

enum CubeColors: Int {
    case redSide = 1
    case orangeSide = 2
    case greenSide = 3
    case blueSide = 4
    case whiteSide = 5
    case yellowSide = 6
    
    
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


