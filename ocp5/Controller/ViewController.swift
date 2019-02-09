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
    
    private var selectedButtonTag: Int?
    private let imagePickerController = UIImagePickerController()
    
    // MARK: - lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        rectangleDownButtonPressed(rectangleDownButton)
        rectangleUpButton.setImage(UIImage(named: "Selected"), for: .selected)
        rectangleDownButton.setImage(UIImage(named: "Selected"), for: .selected)
        fourSquareButton.setImage(UIImage(named: "Selected"), for: .selected)
        gridView.delegate = self
        imagePickerController.delegate = self
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
        
        selectedButtonTag = tag
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            gridView.setImage(image, for: selectedButtonTag!)
        }
        dismiss(animated: true, completion: nil)
    }
}






