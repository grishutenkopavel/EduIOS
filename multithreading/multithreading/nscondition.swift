//
//  nscondition.swift
//  multithreading
//
//  Created by Павел Гришутенко on 13.08.2021.
//

import Foundation

private var condition =NSCondition()
private var flag = false

func test_nscondition1() {
    condition.lock()
    while !flag {
        condition.wait()
    }
    print("test 10")
    condition.unlock()
}

func test_nscondition2() {
    condition.lock()
    flag = true
    condition.signal()
    condition.unlock()
}

func condition_nsthread() {
    
    let thread1 = Thread(block: {
        test_nscondition1()
    })
    
    let thread2 = Thread(block: {
        test_nscondition2()
    })
    
    thread1.start()
    thread2.start()
}
