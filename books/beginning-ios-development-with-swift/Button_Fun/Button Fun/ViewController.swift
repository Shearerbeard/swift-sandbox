//
//  ViewController.swift
//  Button Fun
//
//  Created by Michael Shearer on 9/22/15.
//  Copyright (c) 2015 Shearerbeard.LLC. All rights reserved.
//


import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!

    @IBAction func buttonPressed(sender: UIButton) {
        let title = sender.titleForState(.Normal)
        let plainText = "\(title) button pressed"
        statusLabel.text = plainText
    }

}
