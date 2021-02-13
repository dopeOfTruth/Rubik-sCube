//
//  ViewController.swift
//  InteractionWithColorSquares
//
//  Created by Михаил Красильник on 11.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // Create Cube
    private var cube = CubeSides(forward: CubeColors.redSide.rawValue,
                       back: CubeColors.orangeSide.rawValue,
                       right: CubeColors.greenSide.rawValue,
                       left: CubeColors.blueSide.rawValue,
                       up: CubeColors.whiteSide.rawValue,
                       down: CubeColors.yellowSide.rawValue)
    
    // Create Manager
    private var manager = SidesManager()
    
    
    @IBOutlet var miniCubesViewOfSides: UIStackView!
    // Сube side squares
    @IBOutlet var squares: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray

        setTurnUpGestureRecognizer()
        setTurnDownGestureRecognizer()
        setTurnLeftGestureRecognizer()
        setTurnRightGestureRecognizer()
        sadasd()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        manager.paintSquares(squares: &squares, colorNumber: cube.forward)
    }
    
    //MARK: - ABActions
    
    @IBAction func rotateTheSidesOfCube(_ sender: UIButton) {
        
        manager.getIndexesOfSides(cube: cube)
        
        switch sender.tag {
            case 0: manager.turnTopSideToLeft()
            case 1: manager.turnLeftSideUp()
            case 2: manager.turnRightSideUp()
            case 3: manager.turnTopSideToRight()
            case 4: manager.turnBottomSideToRight()
            case 5: manager.turnRightSideDown()
            case 6: manager.turnLeftSideDown()
            case 7: manager.turnBottomSideToLeft()
            default: break
        }
        
        manager.paintSquares(squares: &squares, colorNumber: cube.forward)
    }
    
    
    @IBAction func refreshCub(_ sender: UIButton) {
        cube = CubeSides(forward: CubeColors.redSide.rawValue,
                           back: CubeColors.orangeSide.rawValue,
                           right: CubeColors.greenSide.rawValue,
                           left: CubeColors.blueSide.rawValue,
                           up: CubeColors.whiteSide.rawValue,
                           down: CubeColors.yellowSide.rawValue)
        
        manager = SidesManager()
        
        manager.paintSquares(squares: &squares, colorNumber: cube.forward)
    }
    
    
    //MARK: - Private Methods
    
    private func appointResponsile(forIndex: Int, whit gestureRecognizer: UITapGestureRecognizer) {
        let square = squares[forIndex]
        square.addGestureRecognizer(gestureRecognizer)
        square.isUserInteractionEnabled = true
    }
    
    private func setTurnUpGestureRecognizer() {
        let panGesture = UITapGestureRecognizer(target: self, action: #selector(turnUp))
        appointResponsile(forIndex: 1, whit: panGesture)
    }
    
    private func setTurnDownGestureRecognizer() {
        let panGesture = UITapGestureRecognizer(target: self, action: #selector(turnDown))
        appointResponsile(forIndex: 7, whit: panGesture)
    }
    
    private func setTurnLeftGestureRecognizer() {
        let panGesture = UITapGestureRecognizer(target: self, action: #selector(panHandlerForBottomLefSquare))
        appointResponsile(forIndex: 3, whit: panGesture)
    }
    
    private func setTurnRightGestureRecognizer() {
        let panGesture = UITapGestureRecognizer(target: self, action: #selector(panHandlerForBottomRightSquare))
        appointResponsile(forIndex: 5, whit: panGesture)
    }
    
    //MARK: - Objc Methods
    
    @objc private func turnUp(_ sender: UITapGestureRecognizer) {
        manager.turnTheCube(withPredicate: "up", cube: &cube, squares: &squares)
    }
    
    @objc private func turnDown(_ sender: UITapGestureRecognizer) {
        manager.turnTheCube(withPredicate: "down", cube: &cube, squares: &squares)
    }
    
    @objc private func panHandlerForBottomLefSquare(_ sender: UITapGestureRecognizer) {
        manager.turnTheCube(withPredicate: "left", cube: &cube, squares: &squares)
    }
    
    @objc private func panHandlerForBottomRightSquare(_ sender: UITapGestureRecognizer) {
        manager.turnTheCube(withPredicate: "right", cube: &cube, squares: &squares)
    }
    
    func sadasd() {
        
        var index = 0
        
        
        let subViewsMiniCubesViewOfSides = miniCubesViewOfSides.subviews
        
        for subViews in subViewsMiniCubesViewOfSides {
            
            let subView = subViews.subviews
            
            for stackview in subView {
                
                let views = stackview.subviews
                
                for view in views {
                    view.backgroundColor = .red
                }
                
            }
            
        }
    }
    
    
    
    
    
}

