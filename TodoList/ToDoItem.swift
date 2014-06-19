//
//  ToDoItem.swift
//  TodoList
//
//  Created by Hu Junfeng on 19/6/14.
//  Copyright (c) 2014 Hu Junfeng. All rights reserved.
//

import UIKit

class ToDoItem {
    var text: String
    var isDone: Bool
    
    init(text: String, isDone: Bool) {
        self.text = text
        self.isDone = isDone
    }
}
