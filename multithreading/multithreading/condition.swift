//
//  condition.swift
//  multithreading
//
//  Created by Павел Гришутенко on 13.08.2021.
//

import Foundation

private var condition = pthread_cond_t()
private var mutex = pthread_mutex_t()
private var flag = false

func test_pthread_condition1() {
    pthread_mutex_lock(&mutex)
    while !flag {
        pthread_cond_wait(&condition, &mutex)
    }
    print("test 9")
    pthread_mutex_unlock(&mutex)
}

func test_pthread_condition2() {
    pthread_mutex_lock(&mutex)
    flag = true
    pthread_cond_signal(&condition)
    pthread_mutex_unlock(&mutex)
}

func condition_pthread() {
    
    var thread1 = pthread_t(bitPattern: 0)
    var attr1 = pthread_attr_t()
    var thread2 = pthread_t(bitPattern: 0)
    var attr2 = pthread_attr_t()
    
    
    //init
    pthread_cond_init(&condition, nil)
    pthread_mutex_init(&mutex, nil)
    pthread_attr_init(&attr1)
    pthread_attr_init(&attr2)
    
    pthread_create(&thread1, &attr1, { pointer in
        test_pthread_condition1()
        return nil
    }, nil)
    
    pthread_create(&thread2, &attr2, { pointer in
        test_pthread_condition2()
        return nil
    }, nil)
}
