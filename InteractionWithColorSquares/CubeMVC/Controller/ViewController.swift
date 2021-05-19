//
//  ViewController.swift
//  InteractionWithColorSquares
//
//  Created by Михаил Красильник on 11.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Private properties
    
    // Create Cube
    private var cube = CubeSides(forward: CubeColors.redSide.rawValue,
                       back: CubeColors.orangeSide.rawValue,
                       left: CubeColors.greenSide.rawValue,
                       right: CubeColors.blueSide.rawValue,
                       top: CubeColors.whiteSide.rawValue,
                       bottom: CubeColors.yellowSide.rawValue)
    
    private var sides = [UIView]()
    
    // Create Managers
    private var sidesManager = CubeSidesManager()
    private var miniCubesManager = MiniCubesSidesManager()
    
    //MARK: - IBOutlets
    
    @IBOutlet var positioningArrow: UIImageView!
    // Mini Cubes
    @IBOutlet var miniCubesViewOfSides: UIStackView!
    // Names for mini cubes
    @IBOutlet var miniCubesSidesLabels: [UILabel]!
    // Сube side squares
    @IBOutlet var squares: [UIView]!
    
    
    //MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray

        sides = miniCubesViewOfSides.subviews
        
        setTurnUpGestureRecognizer()
        setTurnDownGestureRecognizer()
        setTurnLeftGestureRecognizer()
        setTurnRightGestureRecognizer()
        
        setGestureRecognizerForRedSide()
        setGestureRecognizerForOrangeSide()
        setGestureRecognizerForGreenSide()
        setGestureRecognizerForBlueSide()
        setGestureRecognizerForWhiteSide()
        setGestureRecognizerForYellowSide()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        miniCubesManager.paintMiniCubes(with: miniCubesViewOfSides, and: sidesManager)
        sidesManager.paintMainCube(squares: &squares, colorNumber: cube.forward)
        sidesManager.getSidesName(&miniCubesSidesLabels, cube: cube)
        
    }
    
    //MARK: - ABActions
    
    @IBAction func rotateTheSidesOfCube(_ sender: UIButton) {
        
        selectionOfDirectionOfRotation(sender.tag)
        sidesManager.paintMainCube(squares: &squares, colorNumber: cube.forward)
        miniCubesManager.paintMiniCubes(with: miniCubesViewOfSides, and: sidesManager)
    }
    
    @IBAction func startButtonPressed() {
        
        let numberOfCycles = Int.random(in: 15...30)
        
        
        for _ in 0...numberOfCycles {
            
            let indexDirection = Int.random(in: 0...7)
            
            self.selectionOfDirectionOfRotation(indexDirection)
            self.sidesManager.paintMainCube(squares: &self.squares, colorNumber: self.cube.forward)
            self.miniCubesManager.paintMiniCubes(with: self.miniCubesViewOfSides, and: self.sidesManager)
        }
    }
    
    //MARK: - Private Methods
    
    private func selectionOfDirectionOfRotation(_ indexDirection: Int) {
        switch indexDirection {
            case 0: sidesManager.turnTopSideToLeft(cube)
            case 1: sidesManager.turnLeftSideUp(cube)
            case 2: sidesManager.turnRightSideUp(cube)
            case 3: sidesManager.turnTopSideToRight(cube)
            case 4: sidesManager.turnBottomSideToRight(cube)
            case 5: sidesManager.turnRightSideDown(cube)
            case 6: sidesManager.turnLeftSideDown(cube)
            case 7: sidesManager.turnBottomSideToLeft(cube)
            default: break
        }
    }
    
    private func createAnimator(_ pointNumber: Int) {
        
        UIView.animate(withDuration: 1) {
            self.positioningArrow.center.x = self.miniCubesSidesLabels[pointNumber].center.x
        }
    }
    
    private func appointResponsibleForGestureRecognizer(forIndex: Int, with views: [UIView], and gestureRecognizer: UITapGestureRecognizer) {
        let view = views[forIndex]
        view.addGestureRecognizer(gestureRecognizer)
        view.isUserInteractionEnabled = true
    }
    
    
    //MARK: - Gesture Recognizers for mini cubes
    
    private func setGestureRecognizerForRedSide() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handlerOfRedSide))
        appointResponsibleForGestureRecognizer(forIndex: 0, with: sides, and: tapGesture)
    }
    
    private func setGestureRecognizerForOrangeSide() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handlerOfOrangeSide))
        appointResponsibleForGestureRecognizer(forIndex: 1, with: sides, and: tapGesture)
    }
    
    private func setGestureRecognizerForGreenSide() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handlerOfGreenSide))
        appointResponsibleForGestureRecognizer(forIndex: 2, with: sides, and: tapGesture)
    }
    
    private func setGestureRecognizerForBlueSide() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handlerOfBlueSide))
        appointResponsibleForGestureRecognizer(forIndex: 3, with: sides, and: tapGesture)
    }
    
    private func setGestureRecognizerForWhiteSide() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handlerOfWhiteSide))
        appointResponsibleForGestureRecognizer(forIndex: 4, with: sides, and: tapGesture)
    }
    
    private func setGestureRecognizerForYellowSide() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handlerOfYellowSide))
        appointResponsibleForGestureRecognizer(forIndex: 5, with: sides, and: tapGesture)
    }
    
    
    //MARK: - Gesture Recognizer for turn main cube
    
    private func setTurnUpGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(turnUp))
        appointResponsibleForGestureRecognizer(forIndex: 1, with: squares, and: tapGesture)
    }
    
    private func setTurnDownGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(turnDown))
        appointResponsibleForGestureRecognizer(forIndex: 7, with: squares, and: tapGesture)
    }
    
    private func setTurnLeftGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(turnLeft))
        appointResponsibleForGestureRecognizer(forIndex: 3, with: squares, and: tapGesture)
    }
    
    private func setTurnRightGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(turnRight))
        appointResponsibleForGestureRecognizer(forIndex: 5, with: squares, and: tapGesture)
    }
    
    
    //MARK: - Handlers Settings
    
    private func settingForSideSelectionHandlers(withIndex: Int) {
        sidesManager.changePositionOfSides(&cube, index: withIndex)
        sidesManager.paintMainCube(squares: &squares, colorNumber: cube.forward)
        sidesManager.getSidesName(&miniCubesSidesLabels, cube: cube)
        createAnimator(cube.forward)
    }
    
    private func settingForRotationHandlers(withPredicate: String) {
        sidesManager.turnTheCube(withPredicate: withPredicate, cube: &cube, squares: &squares)
        createAnimator(cube.forward)
        sidesManager.getSidesName(&miniCubesSidesLabels, cube: cube)
        
    }
    
    //MARK: - Objc Methods
    
    //MARK: - Handlers for mini cubes
    
    @objc private func handlerOfRedSide(_ sender: UITapGestureRecognizer) {
        settingForSideSelectionHandlers(withIndex: 0)
    }
    
    @objc private func handlerOfOrangeSide(_ sender: UITapGestureRecognizer) {
        settingForSideSelectionHandlers(withIndex: 1)
    }
    
    @objc private func handlerOfGreenSide(_ sender: UITapGestureRecognizer) {
        settingForSideSelectionHandlers(withIndex: 2)
    }
    
    @objc private func handlerOfBlueSide(_ sender: UITapGestureRecognizer) {
        settingForSideSelectionHandlers(withIndex: 3)
    }
    
    @objc private func handlerOfWhiteSide(_ sender: UITapGestureRecognizer) {
        settingForSideSelectionHandlers(withIndex: 4)
    }
    
    @objc private func handlerOfYellowSide(_ sender: UITapGestureRecognizer) {
        settingForSideSelectionHandlers(withIndex: 5)
    }
    
    
    //MARK: - Handlers for main cube
    
    @objc private func turnUp(_ sender: UITapGestureRecognizer) {
        settingForRotationHandlers(withPredicate: "up")
    }
    
    @objc private func turnDown(_ sender: UITapGestureRecognizer) {
        settingForRotationHandlers(withPredicate: "down")
    }
    
    @objc private func turnLeft(_ sender: UITapGestureRecognizer) {
        settingForRotationHandlers(withPredicate: "left")
    }
    
    @objc private func turnRight(_ sender: UITapGestureRecognizer) {
        settingForRotationHandlers(withPredicate: "right")
    }
    
    
}

