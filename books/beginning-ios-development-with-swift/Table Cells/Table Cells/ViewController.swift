//
//  ViewController.swift
//  Table Cells
//
//  Created by Michael Shearer on 10/10/15.
//  Copyright © 2015 Michael Shearer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let cellTableIdentifier = "CellTableIdentifier"

    @IBOutlet var tableView:UITableView!

    let computers = [
        ["Name": "MacBook Air", "Color": "Silver"],
        ["Name": "MacBook Pro", "Color": "Silver"],
        ["Name": "iMac", "Color": "Silver"],
        ["Name": "Mac Mini", "Color": "Silver"],
        ["Name": "Mac Pro", "Color": "Black"]
    ]

    override func viewDidLoad() {

        tableView.registerClass(NameAndTableCellTableViewCell.self,
                forCellReuseIdentifier: cellTableIdentifier)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return computers.count
    }

    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier,
            forIndexPath: indexPath) as! NameAndTableCellTableViewCell

        let rowData = computers[indexPath.row]
        cell.name = rowData["Name"]!
        cell.color = rowData["Color"]!

        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

