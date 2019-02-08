//
//  GridView.swift
//  ocp5
//
//  Created by pith on 28/01/2019.
//  Copyright © 2019 dino. All rights reserved.
//

import UIKit

protocol GridViewDelegate: class {              //   Protocol declaration
    func gridView(didSelectedButton tag: Int)   // class ???????c'est quoi déjà?lié à weak var delegate...?
}
// DELEGATOR
class GridView: UIView {
    
    // MARK: - outlet
    
    @IBOutlet weak var leftUpButton: UIButton! {  // L'état de la var (donc tag)change à l'appui?
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
    
    var state: State = .rectangleUp {
        didSet {
            setGrid(state: state)
        }
    }
    
    weak var delegate: GridViewDelegate?      //////////// DELEGATE.  // weak c'est quoi? retain cycle...
    
    // MARK: - action
    
    @IBAction func buttonTapped(_sender: UIButton) {
        print("Le bouton appuyé a comme Tag: \(_sender.tag) ")
        delegate?.gridView(didSelectedButton: _sender.tag)
    }
    
//    @IBAction func upLeftButtonTapped(_ sender: UIButton) {
//        print("up left button tapped")
//    }
//    @IBAction func upRightButtonTapped(_ sender: UIButton) {
//        if state == .rectangleUp {
//            print("rectangle up tapped")
//        } else {
//            print("up right button tapped")
//        }
//    }
//    @IBAction func downLeftButtonTapped(_ sender: UIButton) {
//        print("down left button tapped")
//    }
//    @IBAction func downRightButtonTapped(_ sender: UIButton) {
//        if state == .rectangleDown {
//            print("rectangle down tapped")
//        } else {
//            print("down right button tapped")
//        }
//    }
    
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

