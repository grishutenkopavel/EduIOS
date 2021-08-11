//
//  objc_pthread.swift
//  multithreading
//
//  Created by Павел Гришутенко on 11.08.2021.
//

import Foundation


func nsthread() {
    let thread = Thread(block: {
        print("test 2")
    })
    thread.start()
}
