//
//  ViewController.swift
//  DisplayArray
//
//  Created by Omri Gazitt on 7/24/16.
//  Copyright © 2016 Omri Gazitt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var nameTextBox: UITextField!
    
    
    @IBAction func addButtonTap(sender: AnyObject) {
        
        let value = nameTextBox.text

        /*
        var vals = ValueList.Values
        vals.append(value!)
        
        ValueList.Values = vals
        */
        ValueList.Values.append(value!)
        
        self.dismissViewControllerAnimated(true, completion: {})
    }
}

