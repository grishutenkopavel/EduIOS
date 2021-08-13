//
//  rmutex.swift
//  multithreading
//
//  Created by Павел Гришутенко on 13.08.2021.
//

import Foundation

private var mutex = pthread_mutex_t()
private var mutattr = pthread_mutexattr_t()


func test_rmutex_inner() {
    pthread_mutex_lock(&mutex)
    print("test 7")
    pthread_mutex_unlock(&mutex)
}

func test_rmutex() {
    
    pthread_mutexattr_settype(&mutattr, PTHREAD_MUTEX_RECURSIVE)
    pthread_mutex_init(&mutex, nil)
    
    pthread_mutex_lock(&mutex)
    test_rmutex_inner()
    pthread_mutex_unlock(&mutex)
}


func pthread_rmutex() {
    var thread = pthread_t(bitPattern: 0)
    var attr = pthread_attr_t()
    
    pthread_attr_init(&attr)
    
    pthread_create(&thread, &attr, { pointer in
        test_rmutex()
        return nil
    }, nil)
}
