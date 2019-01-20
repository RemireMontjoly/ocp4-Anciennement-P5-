//
//  ViewController.swift
//  ocp5
//
//  Created by pith on 16/12/2018.
//  Copyright © 2018 dino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var button1: UIButton!
    
    
    @IBAction func button1Pressed(_ sender: UIButton) {
        if let image = UIImage(named: "Selected") {
            sender.setImage(image, for: .normal)
        }
        
    }
    
  
    
    @IBAction func button2Pressed(_ sender: UIButton) {
        if let image = UIImage(named: "Selected") {
            sender.setImage(image, for: .normal)
        }
    }
    
    
    
    @IBAction func button3Pressed(_ sender: UIButton) {
        if let image = UIImage(named: "Selected") {
            sender.setImage(image, for: .normal)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

