//
//  GridView.swift
//  ocp5
//
//  Created by pith on 28/01/2019.
//  Copyright © 2019 dino. All rights reserved.
//

import UIKit

class GridView: UIView {
    
    // MARK: - outlet
    
    @IBOutlet weak var leftUpButton: UIButton!
    @IBOutlet weak var rightUpButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    var rectangleUpButton = UIButton()
    //   var rectangleDownButton = UIButton()
    
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
    
    private func setGrid (state: State) {
        switch state {
        case .rectangleUp:
            if bottomStackView.arrangedSubviews.count == 1 || (topStackView.arrangedSubviews.count == 2 && bottomStackView.arrangedSubviews.count == 2) {
                bottomStackView.addArrangedSubview(bottomLeftButton)
                topStackView.removeArrangedSubview(leftUpButton)
            }
            
        case .rectangleDown:
            if topStackView.arrangedSubviews.count == 1 || (topStackView.arrangedSubviews.count == 2 && bottomStackView.arrangedSubviews.count == 2) {
             
               bottomStackView.removeArrangedSubview(bottomLeftButton)
                topStackView.addArrangedSubview(leftUpButton)
            }
            
        case .fourSquare:
            if topStackView.arrangedSubviews.count == 1 {
                topStackView.addArrangedSubview(leftUpButton)
            } else if bottomStackView.arrangedSubviews.count == 1 {
                bottomStackView.addArrangedSubview(bottomLeftButton)
            }
        }
    }
    
}
