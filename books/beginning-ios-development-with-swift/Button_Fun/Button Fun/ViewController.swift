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
        let title = sender.titleForState(.Normal)!
        func titleOrDefault(titleText: String?) -> String {
            return title ?? ""
        }
        let plainText = "\(titleOrDefault(title)) button pressed"
        let styledText = NSMutableAttributedString(string: plainText)
        let attributes = [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(statusLabel.font.pointSize)
        ]
        let nameRange = (plainText as NSString).rangeOfString(titleOrDefault(title))
        styledText.setAttributes(attributes, range: nameRange)

        statusLabel.attributedText = styledText
    }

}
