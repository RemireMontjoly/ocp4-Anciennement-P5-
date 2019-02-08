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
    
    private var selectedButton: Int?
    
    // let button = UIButton()
    
    // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rectangleDownButtonPressed(rectangleDownButton)
        
        rectangleUpButton.setImage(UIImage(named: "Selected"), for: .selected)
        rectangleDownButton.setImage(UIImage(named: "Selected"), for: .selected)
        fourSquareButton.setImage(UIImage(named: "Selected"), for: .selected)
        gridView.delegate = self
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
}

extension ViewController: GridViewDelegate {
    func gridView(didSelectedButton tag: Int) {
        
        selectedButton = tag
        
        print("selected Button Tag = \(selectedButton!)")
        
        // 1.UIImagePickerController
        
        // 2.UIImagePickerControllerDelegate - getImage
        
        //3.UIImagePickerControllerDelegate - gridView.setImage(UIImage, tag)
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






