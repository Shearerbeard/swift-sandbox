//
//  DatePickerViewController.swift
//  PIckers
//
//  Created by Michael Shearer on 10/5/15.
//  Copyright © 2015 Michael Shearer. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        let date = datePicker.date
        let message  = "The time you have selected is \(date)"
        let alert = UIAlertController(
            title: "Date and time selected", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Thats So True", style: .Default, handler: nil)
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        datePicker.setDate(date, animated: true)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
