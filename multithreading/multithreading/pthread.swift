//
//  File.swift
//  multithreading
//
//  Created by Павел Гришутенко on 10.08.2021.
//

import Foundation

func c_style(){
    var thread = pthread_t(bitPattern: 0)
    var attr = pthread_attr_t()
    
    pthread_attr_init(&attr)
    pthread_create(&thread, &attr, { pointer in
        print("test 1")
        return nil
    }, nil)
}
