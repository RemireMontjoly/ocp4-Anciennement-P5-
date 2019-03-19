//
//  GridView.swift
//  ocp5
//
//  Created by pith on 28/01/2019.
//  Copyright © 2019 dino. All rights reserved.
//

import UIKit

protocol GridViewDelegate: class {
    func gridView(_ gridView: GridView, didSelectButton tag: Int)
}

class GridView: UIView {
    
    // MARK: - outlet
    
    @IBOutlet private weak var leftUpButton: UIButton! {
        didSet {
            leftUpButton.tag = 1
        }
    }
    @IBOutlet private weak var rightUpButton: UIButton! {
        didSet {
            rightUpButton.tag = 2
        }
    }
    @IBOutlet private weak var bottomLeftButton: UIButton! {
        didSet {
            bottomLeftButton.tag = 3
        }
    }
    @IBOutlet private weak var bottomRightButton: UIButton! {
        didSet {
            bottomRightButton.tag = 4
        }
    }
    @IBOutlet private weak var topStackView: UIStackView!
    @IBOutlet private weak var bottomStackView: UIStackView!
    
    // MARK: - properties
    
    var state: State = .rectangleUp {
        didSet {
            setGrid(state: state)
        }
    }
    
    weak var delegate: GridViewDelegate?
    
    enum State {
        case rectangleUp, rectangleDown, fourSquare
    }
    
    // MARK: - public
    
    func asImage() -> UIImage {
        
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
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
    
    func gridDisappear(orientationPortrait: Bool) {
        let translationTransform: CGAffineTransform
        if orientationPortrait == true {
            translationTransform = CGAffineTransform(translationX: 0, y:  -1000)
        } else {
            translationTransform = CGAffineTransform(translationX: -1000, y: 0)
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.transform = translationTransform
        }, completion: nil)
    }
    
    func gridAppear() {
        self.transform = .identity
    }
    
    
    // Bonus : animation
    
    func animation() {
        self.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.transform = .identity
        }, completion: nil)
    }
    
    // MARK: - action
    
    @IBAction private func buttonTapped(_ sender: UIButton) {
        delegate?.gridView(self, didSelectButton: sender.tag)
    }
    
    // MARK: private
    
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


