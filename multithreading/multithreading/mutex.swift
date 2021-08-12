//
//  mutex.swift
//  multithreading
//
//  Created by Павел Гришутенко on 12.08.2021.
//

import Foundation


func test_mutex(){
    var mutex = pthread_mutex_t()
    pthread_mutex_init(&mutex, nil)
    
    pthread_mutex_lock(&mutex)
    print("test 5")
    pthread_mutex_unlock(&mutex)
}


func pthread_mutex(){
    var thread = pthread_t(bitPattern: 0)
    var attr = pthread_attr_t()
    
    pthread_attr_init(&attr)
    pthread_create(&thread, &attr, { pointer in
        test_mutex()
        return nil
    }, nil)
}
