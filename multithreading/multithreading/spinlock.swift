//
//  spinlock.swift
//  multithreading
//
//  Created by Павел Гришутенко on 16.08.2021.
//

import Foundation


func test_spinlock(){
    var lock = OS_SPINLOCK_INIT
    
    
    OSSpinLockLock(&lock)
    print("test 11")
    OSSpinLockUnlock(&lock)
}


func spinlock(){
    var thread = pthread_t(bitPattern: 0)
    var attr = pthread_attr_t()
    
    pthread_attr_init(&attr)
    pthread_create(&thread, &attr, { pointer in
        test_spinlock()
        return nil
    }, nil)
}
