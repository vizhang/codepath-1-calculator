//
//  SettingsViewController.swift
//  clcltr
//
//  Created by Victor Zhang on 8/23/15.
//  Copyright (c) 2015 Victor Zhang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var setTipButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Load the default tip
        var defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("default_tip") != nil) {
            var defaultTip:String = String(format:"%.1f", defaults.doubleForKey("default_tip") * 100)
            tipTextField.text = defaultTip
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTouched(sender: AnyObject) {
        
        var defaultTip = (tipTextField.text as NSString).doubleValue / 100.00
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(defaultTip, forKey: "default_tip")
        defaults.synchronize()
        
        println("set tip to \(defaultTip)")
        

        var alert = UIAlertController(title: "Success", message: "Tip Set!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func backTouched(sender: AnyObject) {
            dismissViewControllerAnimated(true, completion: nil)
    
    }
    
}
