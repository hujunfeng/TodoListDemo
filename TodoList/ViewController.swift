//
//  ViewController.swift
//  TodoList
//
//  Created by Hu Junfeng on 19/6/14.
//  Copyright (c) 2014 Hu Junfeng. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, DetailViewControllerDelegate {
    
    var items = ToDoItem[]()
                            
    override func viewDidLoad() {
        super.viewDidLoad()

        for idx in 0..10 {
            let newItem = ToDoItem(text: "item \(idx)", isDone: false)
            items += newItem
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int  {
        return items.count;
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell") as? UITableViewCell;
        let item = items[indexPath.row]
        cell!.accessoryType = item.isDone ? .Checkmark : .None
        cell!.textLabel.text = item.text
        return cell;
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)  {
        self.performSegueWithIdentifier("ShowDetail", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "ShowDetail" {
            let detailVC = segue.destinationViewController as? DetailViewController
            let selectedCell = sender as? UITableViewCell
            let selectedIndex = tableView.indexPathForCell(selectedCell)
            detailVC!.item = items[selectedIndex.row]
            detailVC!.delegate = self
        }
    }
    
    func detailViewControllerDidSave(item: ToDoItem) {
        tableView.reloadData()
    }
}

