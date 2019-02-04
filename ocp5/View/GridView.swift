//
//  GridView.swift
//  ocp5
//
//  Created by pith on 28/01/2019.
//  Copyright © 2019 dino. All rights reserved.
//

import UIKit

class GridView: UIView {
    
    let button = UIButton()
    
    // MARK: - outlet
    
    @IBOutlet weak var leftUpButton: UIButton!
    @IBOutlet weak var rightUpButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var bottomStackView: UIStackView!
    
    // MARK: - enum
    
    enum State {
        case rectangleUp, rectangleDown, fourSquare
    }
    
    // MARK: - properties
    
    var state: State = .rectangleUp {
        didSet {
            setGrid(state: state)
        }
    }
    
    // MARK: - action
    
    @IBAction func upLeftButtonTapped(_ sender: UIButton) {
        print("up left button tapped")
    }
    @IBAction func upRightButtonTapped(_ sender: UIButton) {
        if state == .rectangleUp {
            print("rectangle up tapped")
        } else {
            print("up right button tapped")
        }
    }
    @IBAction func downLeftButtonTapped(_ sender: UIButton) {
        print("down left button tapped")
    }
    @IBAction func downRightButtonTapped(_ sender: UIButton) {
        if state == .rectangleDown {
            print("rectangle down tapped")
        } else {
            print("down right button tapped")
        }
    }
    
    private func setGrid (state: State) {
        switch state {
        case .rectangleUp:
            
            leftUpButton.isHidden = true
            rightUpButton.isHidden = false
            bottomLeftButton.isHidden = false
            bottomRightButton.isHidden = false
            
        case .rectangleDown:
            
            leftUpButton.isHidden = false
            rightUpButton.isHidden = false
            bottomLeftButton.isHidden = true
            bottomRightButton.isHidden = false
            
        case .fourSquare:
            
            leftUpButton.isHidden = false
            rightUpButton.isHidden = false
            bottomLeftButton.isHidden = false
            bottomRightButton.isHidden = false
        }
    }
}
//    @objc func didTapButton(_ sender: UIButton) {
//        print("button pressed")
//    }
//
//    //  MARK: - private
//
//    private func setUpButtons() {
//
//        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//    }

