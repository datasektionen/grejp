//
//  FeedViewController.swift
//  Greip
//
//  Created by Emma Nimstad on 19/5/16.
//  Copyright © 2016 Emma Nimstad. All rights reserved.
//

import Foundation
import UIKit

var reusableCellId = "tablefeedcell"

class FeedViewController : UITableViewController {
    var data = []
    
    override func viewDidLoad() {
        data = GetData.getData()
        
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reusableCellId) as! FeedCell
        let post = data.objectAtIndex(indexPath.row) as! Post
        
        cell.title.text = post.title
        cell.content.text = post.content
        cell.time.text = post.time
        
        cell.separatorInset = UIEdgeInsetsMake(0, 12, 0, 12)
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsetsZero
        
        return cell
    }
}