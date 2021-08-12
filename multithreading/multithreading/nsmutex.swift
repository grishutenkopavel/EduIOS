//
//  nsmutex.swift
//  multithreading
//
//  Created by Павел Гришутенко on 12.08.2021.
//

import Foundation

func test_nsmutex(){
    let mutex = NSLock()
    mutex.lock()
    print("test 6")
    mutex.unlock()
}


func nsthread_mutex(){
    let thread = Thread(block: {
        test_nsmutex()
    })
    thread.start()
}
