//
//  ViewController.swift
//  Sections
//
//  Created by Michael Shearer on 10/11/15.
//  Copyright © 2015 Michael Shearer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let sectionTableIdentifier = "SectionTableIdentifier"

    var names: [String: [String]]!
    var keys: [String]!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(UITableViewCell.self,
                forCellReuseIdentifier: sectionTableIdentifier)

        let path = NSBundle.mainBundle().pathForResource(
            "sortednames", ofType: "plist")

        let namesDict = NSDictionary(contentsOfFile: path!)
        names = namesDict as! [String: [String]]
        keys = (namesDict!.allKeys as! [String]).sort()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let nameSection = names[key]!
        return nameSection.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(sectionTableIdentifier, forIndexPath: indexPath)
        let key = keys[indexPath.section]
        let nameSection = names[key]!
        cell.textLabel?.text = nameSection[indexPath.row]
        
        return cell
    }

}

