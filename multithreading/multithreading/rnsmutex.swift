//
//  rnsmutex.swift
//  multithreading
//
//  Created by Павел Гришутенко on 13.08.2021.
//

import Foundation

private let rmutex = NSRecursiveLock()

func test_rnsmutex_inner(){
    rmutex.lock()
    print("test 8")
    rmutex.unlock()
}

func test_rnsmutex(){
    rmutex.lock()
    test_rnsmutex_inner()
    rmutex.unlock()
}


func nsthread_rmutex(){
    let thread = Thread(block: {
        test_rnsmutex()
    })
    thread.start()
}
