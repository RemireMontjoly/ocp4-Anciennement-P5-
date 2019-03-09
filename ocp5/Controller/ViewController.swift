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
    
    @IBOutlet private weak var rectangleUpButton: UIButton!
    @IBOutlet private weak var rectangleDownButton: UIButton!
    @IBOutlet private weak var fourSquareButton: UIButton!
    @IBOutlet private weak var gridView: GridView!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var swipeGestureRecognizer: UISwipeGestureRecognizer!
    
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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft || UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
            textLabel.text = "Swipe left to share"
            swipeGestureRecognizer.direction = .left
            
        } else {
            textLabel.text = "Swipe up to share"
            swipeGestureRecognizer.direction = .up
        }
    }
    
    // MARK: - actions
    
    @IBAction private func rectangleUpButtonPressed(_ sender: UIButton) {
        
        rectangleUpButton.isSelected = true
        rectangleDownButton.isSelected = false
        fourSquareButton.isSelected = false
        gridView.state = .rectangleUp
        gridView.animation()
    }
    
    @IBAction private func rectangleDownButtonPressed(_ sender: UIButton) {
        
        rectangleDownButton.isSelected = true
        rectangleUpButton.isSelected = false
        fourSquareButton.isSelected = false
        gridView.state = .rectangleDown
        gridView.animation()
    }
    
    @IBAction private func fourSquareButtonPressed(_ sender: UIButton) {
        
        fourSquareButton.isSelected = true
        rectangleUpButton.isSelected = false
        rectangleDownButton.isSelected = false
        gridView.state = .fourSquare
        gridView.animation()
    }
    
    @IBAction private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        
        let image = gridView.asImage()
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityViewController, animated: true)
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
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
            let tag = selectedButtonTag {
            gridView.setImage(image, for: tag)
        }
        dismiss(animated: true, completion: nil)
    }
}






