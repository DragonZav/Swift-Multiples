//
//  ViewController.swift
//  Multiples
//
//  Created by Chris Augg on 11/25/15.
//  Copyright © 2015 Auggie Doggie iOSware. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    // IBOutlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var addButtonBgImage: UIButton!
    @IBOutlet weak var playButtonBgImage: UIButton!
    @IBOutlet weak var multipleTxtField: UITextField!
    @IBOutlet weak var evaluationLabel: UILabel!
    
    // Properties
    var numA = 0
    var numB = 0
    
    // Constant
    let maxSum = 1000
    
    // Viewcontroller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.multipleTxtField.delegate = self;
        
    }
    
    // Allowing the keyboard to minimize when return key is pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    
    
    // IBActions
    @IBAction func playButtonPressed() {
        
        
        if let possibleNumber = Int(multipleTxtField.text!) {
            numA = possibleNumber
            startMultiples(true, sectionB: false)
        } else {
            let alertController = UIAlertController(title: "Validation Error", message: "You must enter an integer number!", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: {(alert : UIAlertAction!) in
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            alertController.addAction(alertAction)
            presentViewController(alertController, animated: true, completion: nil)
            
           
        }

       
        
    }
    
    @IBAction func addButtonPressed() {
        
        let number = sum(numA, numY: numB)
        evaluationLabel.text = "\(numB) + \(numA) = \(number)"
        numB = number
        
        if isGameOver() {
            numA = 0
            numB = 0
            // reset text
            multipleTxtField.text = ""
            evaluationLabel.text = "Press Add to Add!"
            startMultiples(false, sectionB: true)
        }
        
    }
    
    // functions
    
    func sum(numX: Int, numY: Int) -> Int {
        return numX + numY
    }
    
    func isGameOver() -> Bool {
        return numB >= maxSum
    }
    
    
    func startMultiples(sectionA: Bool, sectionB: Bool) {
        
        logoImage.hidden = sectionA
        multipleTxtField.hidden = sectionA
        playButtonBgImage.hidden = sectionA
        
        addButtonBgImage.hidden = sectionB
        evaluationLabel.hidden = sectionB
    }

}

