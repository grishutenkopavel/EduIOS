//
//  objc_pthread.swift
//  multithreading
//
//  Created by Павел Гришутенко on 11.08.2021.
//

import Foundation


func qos_nsthread() {
    let thread = Thread(block: {
        print("test 4")
    })
    thread.qualityOfService = .userInitiated
    thread.start()
}
