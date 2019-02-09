//
//  GridView.swift
//  ocp5
//
//  Created by pith on 28/01/2019.
//  Copyright © 2019 dino. All rights reserved.
//

import UIKit

protocol GridViewDelegate: class {
    func gridView(didSelectedButton tag: Int)
}
// DELEGATOR
class GridView: UIView {
    
    // MARK: - outlet
    
    @IBOutlet weak var leftUpButton: UIButton! {  
        didSet {
            leftUpButton.tag = 1
        }
    }
    @IBOutlet weak var rightUpButton: UIButton! {
        didSet {
            rightUpButton.tag = 2
        }
    }
    @IBOutlet weak var bottomLeftButton: UIButton! {
        didSet {
            bottomLeftButton.tag = 3
        }
    }
    @IBOutlet weak var bottomRightButton: UIButton! {
        didSet {
            bottomRightButton.tag = 4
        }
    }
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var bottomStackView: UIStackView!
    
    // MARK: - properties
    
    // var buttonsArray = [leftUpButton, rightUpButton, bottomLeftButton, bottomRightButton]() NE FONCTIONNE PAS?
    
    var state: State = .rectangleUp {
        didSet {
            setGrid(state: state)
        }
    }
    
    weak var delegate: GridViewDelegate?
    
    // MARK: - action
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Le bouton appuyé a comme Tag: \(sender.tag) ")
        delegate?.gridView(didSelectedButton: sender.tag)
    }
    
    func setImage(_ image: UIImage, for tag: Int) {
        
        if leftUpButton.tag == tag {
            leftUpButton.setImage(image, for: .normal)
        } else if rightUpButton.tag == tag {
            rightUpButton.setImage(image, for: .normal)
        } else if bottomLeftButton.tag == tag {
            bottomLeftButton.setImage(image, for: .normal)
        } else if bottomRightButton.tag == tag {
            bottomRightButton.setImage(image, for: .normal)
        }
    }
    // MARK: - enum
    
    enum State {
        case rectangleUp, rectangleDown, fourSquare
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


