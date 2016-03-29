//
//  ViewController.swift
//  FindPerfectNumber
//
//  Created by Joseph Jensen on 2/4/16.
//  Copyright © 2016 Joseph Jensen. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var lowerBoundTextField: UITextField!
    @IBOutlet weak var upperBoundTextField: UITextField!

    @IBAction func findPerfectNumberButton(sender: UIButton) {
        
        // get lower bound from text field as int
        guard let lowerBound = Int(lowerBoundTextField.text!) else { return }
        // get upper bound from text field as int
        guard let upperBound = Int(upperBoundTextField.text!) else { return }
        
        var outputPerfectNum = "No Perfect Number Found."
        // call perfect num
        if let perfectNum = findPerfectNumber(lowerBound, upper: upperBound) {
            outputPerfectNum = String(perfectNum)
        }
        
        // convert to string
        //place in alert controller text
        
        let alertController = UIAlertController(title: "Perfect Number Found:", message: outputPerfectNum, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func findPerfectNumber (lower: Int, upper: Int) -> Int? {
        var index : Int = lower
        
        while (index <= upper) {
            // check if it's even. odd numbers aren't perfect
            if (index % 2 != 1) {
                let primeFactors = findPrimeFactors(index)
                var sum = 0
                for num in primeFactors {
                    sum += num
                }
                if (sum == index) {
                    return index
                }
            }
            index++
        }
        return nil
        
    }
    
    func findPrimeFactors (input : Int) -> [Int] {
        var factors = [Int] ()
        factors.append(1)
        
        for var i = 2; i < input; i++ {
            if (input % i == 0) {
                factors.append(i)
            }
        }
        
        return factors
    }
    
    
    
}


















