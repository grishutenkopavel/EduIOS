//
//  File.swift
//  multithreading
//
//  Created by Павел Гришутенко on 10.08.2021.
//

import Foundation

func qos_pthread(){
    var thread = pthread_t(bitPattern: 0)
    var attr = pthread_attr_t()
    
    pthread_attr_init(&attr)
    pthread_attr_set_qos_class_np(&attr, QOS_CLASS_USER_INITIATED, 0)
    pthread_create(&thread, &attr, { pointer in
        
        print("test 3")
        pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0)
        
        return nil
    }, nil)
}
