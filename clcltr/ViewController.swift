//
//  ViewController.swift
//  clcltr
//
//  Created by Victor Zhang on 8/23/15.
//  Copyright (c) 2015 Victor Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipSegControl: UISegmentedControl!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    var defaultTip = 0.18;
    var tipPercentages = [0.18, 0.20, 0.22]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
        
        //Load the default tip
        var defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("default_tip") != nil) {
            defaultTip = defaults.doubleForKey("default_tip")
            tipPercentages[0] = defaultTip
            var defaultTipString = String(format:"%.2f", defaultTip*100) + "%"
            tipSegControl.setTitle(defaultTipString, forSegmentAtIndex: 0)
        }
        println(defaultTip)
        defaults.synchronize()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentage = tipPercentages[tipSegControl.selectedSegmentIndex];
        
        //Currency Text
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        var billAmount = (billTextField.text as NSString).doubleValue
        println("bill amount: $\(billAmount)")
        
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)

        
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
}

