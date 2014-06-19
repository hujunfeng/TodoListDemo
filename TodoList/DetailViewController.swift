//
//  DetailViewController.swift
//  TodoList
//
//  Created by Hu Junfeng on 19/6/14.
//  Copyright (c) 2014 Hu Junfeng. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate {
    func detailViewControllerDidSave(item: ToDoItem)
}

class DetailViewController: UIViewController {

    var item: ToDoItem?
    var delegate: DetailViewControllerDelegate?

    @IBOutlet var textField: UITextField
    @IBOutlet var toggle: UISwitch
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.text = item!.text
        toggle.on = item!.isDone!
    }

    @IBAction func saveItem(sender: AnyObject) {
        item!.text = textField.text
        item!.isDone = toggle.on
        delegate!.detailViewControllerDidSave(item!)
        navigationController.popViewControllerAnimated(true)
    }
}
