//
//  unfirelock.swift
//  multithreading
//
//  Created by Павел Гришутенко on 16.08.2021.
//

import Foundation

func test_unfairloc(){
    var lock = os_unfair_lock_s()
    
    os_unfair_lock_lock(&lock)
    print("test 12")
    os_unfair_lock_unlock(&lock)
}


func unfairlock(){
    var thread = pthread_t(bitPattern: 0)
    var attr = pthread_attr_t()
    
    pthread_attr_init(&attr)
    pthread_create(&thread, &attr, { pointer in
        test_unfairloc()
        return nil
    }, nil)
}
