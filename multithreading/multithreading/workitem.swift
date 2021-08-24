//
//  workitem.swift
//  multithreading
//
//  Created by Павел Гришутенко on 23.08.2021.
//

import Foundation

class DispatchWorkItemTest {
    private static let queue = DispatchQueue(label: "DispatchWorkItem", attributes: .concurrent)
    
    static func testNotify() {
        let item = DispatchWorkItem {
            print("start test 13")
        }
        item.notify(queue: DispatchQueue.main, execute: {
            print("finish test 13")
        })
        queue.async(execute: item)
    }
    
}
