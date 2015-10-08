//
//  ViewController.swift
//  Simple Table
//
//  Created by Michael Shearer on 10/7/15.
//  Copyright © 2015 Michael Shearer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let dwarves  = [
        "Sleepy", "Sneezy", "Bashful", "Happy",
        "Doc", "Grumpy", "Dorin", "Nori", "Ori",
        "Balin", "Dwalin", "Fili", "Kili",
        "Oin", "Gloin", "Bifur", "Bofur", "Bombur"
    ]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) 
        if cell == nil {
            cell = UITableViewCell(
                style: UITableViewCellStyle.Default, reuseIdentifier: simpleTableIdentifier)
        }
        
        let image = UIImage(named: "star")
        cell!.imageView?.image = image
        
        let higlightedImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = higlightedImage
        
        cell!.textLabel?.text = dwarves[indexPath.row]
        return cell!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

