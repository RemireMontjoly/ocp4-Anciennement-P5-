//
//  ViewController.swift
//  ocp5
//
//  Created by pith on 16/12/2018.
//  Copyright © 2018 dino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //  let grid = GridView()
    
    @IBOutlet weak var centralViewLeftUpButton: UIButton!
    @IBOutlet weak var centralViewRightUpButton: UIButton!
    @IBOutlet weak var centralViewBottomLeftButton: UIButton!
    @IBOutlet weak var centralViewBottomRightButton: UIButton!
    
    
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var bottomStackView: UIStackView!
    
    
    @IBOutlet weak var rectangleUpButton: UIButton!
    @IBOutlet weak var rectangleDownButton: UIButton!
    @IBOutlet weak var fourSquareButton: UIButton!
    
    
    
    @IBAction func rectangleUpButtonPressed(_ sender: UIButton) {
        
        rectangleUpButton.setImage(UIImage(named: "Selected"), for: .selected)
        rectangleUpButton.isSelected = true
        
        rectangleDownButton.isSelected = false
        fourSquareButton.isSelected = false
        
        
        
        if bottomStackView.arrangedSubviews.count == 1 || (topStackView.arrangedSubviews.count == 2 && bottomStackView.arrangedSubviews.count == 2) {
            bottomStackView.addArrangedSubview(centralViewBottomLeftButton)
            topStackView.removeArrangedSubview(centralViewLeftUpButton)
        }
    }
    
    @IBAction func rectangleDownButtonPressed(_ sender: UIButton) {
        
        rectangleDownButton.setImage(UIImage(named: "Selected"), for: .selected)
        rectangleDownButton.isSelected = true
        
        rectangleUpButton.isSelected = false
        fourSquareButton.isSelected = false
        
       
        if topStackView.arrangedSubviews.count == 1 || (topStackView.arrangedSubviews.count == 2 && bottomStackView.arrangedSubviews.count == 2) {
            bottomStackView.removeArrangedSubview(centralViewBottomLeftButton)
            topStackView.addArrangedSubview(centralViewLeftUpButton)
        }
        
        
    }
    
    @IBAction func fourSquareButtonPressed(_ sender: UIButton) {
        fourSquareButton.setImage(UIImage(named: "Selected"), for: .selected)
        fourSquareButton.isSelected = true
        
        rectangleUpButton.isSelected = false
        rectangleDownButton.isSelected = false
        
        if topStackView.arrangedSubviews.count == 1 {
       topStackView.addArrangedSubview(centralViewLeftUpButton)
        } else if bottomStackView.arrangedSubviews.count == 1 {
            bottomStackView.addArrangedSubview(centralViewBottomLeftButton)
        }
            
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

