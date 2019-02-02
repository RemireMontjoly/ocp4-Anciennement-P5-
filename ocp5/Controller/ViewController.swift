//
//  ViewController.swift
//  ocp5
//
//  Created by pith on 16/12/2018.
//  Copyright © 2018 dino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - outlets
    
    @IBOutlet weak var rectangleUpButton: UIButton!
    @IBOutlet weak var rectangleDownButton: UIButton!
    @IBOutlet weak var fourSquareButton: UIButton!
    @IBOutlet weak var gridView: GridView!
    
    // MARK: - properties
    
  let button = UIButton()
    
    // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
     rectangleDownButtonPressed(rectangleDownButton)
        
        rectangleUpButton.setImage(UIImage(named: "Selected"), for: .selected)
        rectangleDownButton.setImage(UIImage(named: "Selected"), for: .selected)
        fourSquareButton.setImage(UIImage(named: "Selected"), for: .selected)
    }
    
    // MARK: - actions
    
    @IBAction func rectangleUpButtonPressed(_ sender: UIButton) {
        
        rectangleUpButton.isSelected = true
        
        rectangleDownButton.isSelected = false
        fourSquareButton.isSelected = false
        gridView.state = .rectangleUp
        
    }
    
    @IBAction func rectangleDownButtonPressed(_ sender: UIButton) {
        
        rectangleDownButton.isSelected = true
        
        rectangleUpButton.isSelected = false
        fourSquareButton.isSelected = false
        gridView.state = .rectangleDown
    }
    
    @IBAction func fourSquareButtonPressed(_ sender: UIButton) {
        
        fourSquareButton.isSelected = true
        
        rectangleUpButton.isSelected = false
        rectangleDownButton.isSelected = false
        gridView.state = .fourSquare
    }
        
    @IBAction func leftUpButtonTapped(_ sender: UIButton) {
       
      print("Left up button tapped")
        
    }
    
    @IBAction func rightUpButtonTapped(_ sender: UIButton) {
        if gridView.state == .rectangleUp {
            print("rectangle up tapped")
        } else {
            print("right up button tapped")
        }
    }
    
    @IBAction func leftDownButtonTapped(_ sender: UIButton) {
       
            print("Left down button tapped")
        
    }
    
    @IBAction func rightDownButtonTapped(_ sender: UIButton) {
        if gridView.state == .rectangleDown {
            print("rectangle down tapped")
        } else {
            print("right down button tapped")
        }
    }
    
    
    
    
    
//
//    @objc func didTapButton(_ sender: UIButton) {
//        print("button pressed")
//    }
//
//    //  MARK: - private
//
//    private func setUpButtons() {
//
//        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        
//    }
    
    

    
}

