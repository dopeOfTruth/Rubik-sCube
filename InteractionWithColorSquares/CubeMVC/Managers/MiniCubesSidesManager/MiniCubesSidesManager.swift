//
//  MiniCubesManager.swift
//  InteractionWithColorSquares
//
//  Created by Михаил Красильник on 14.02.2021.
//

import UIKit

class MiniCubesSidesManager {
    
    func paintMiniCubes(with mainStackView: UIStackView, and manager: CubeSidesManager) {
        
        var index = 0
        
        let subViewsMiniCubesViewOfSides = mainStackView.subviews
        
        for subViews in subViewsMiniCubesViewOfSides {
            
            let subView = subViews.subviews
            
            var colorIndex = 0
            
            for stackview in subView {
                
                let views = stackview.subviews
                
                if colorIndex == 9 {
                    colorIndex = 0
                }
                
                for view in views {
                    view.backgroundColor = manager.sides[index][colorIndex]
                    
                    colorIndex += 1
                }
            }
            
            index += 1
        }
    }
}

