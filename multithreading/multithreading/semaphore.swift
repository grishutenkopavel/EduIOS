//
//  semaphore.swift
//  multithreading
//
//  Created by Павел Гришутенко on 24.08.2021.
//

import Foundation

class SemaphoreTest {
    private static let semaphore1 = DispatchSemaphore(value: 0)
    private static let semaphore2 = DispatchSemaphore(value: 2)
    
    private static func doWork() {
        self.semaphore2.wait()
        print("test 15")
        sleep(3)
        self.semaphore2.signal()
    }
    static func testSemaphore1() {
        DispatchQueue.global().async {
            sleep(3)
            print("start test 14")
            self.semaphore1.signal()
        }
        self.semaphore1.wait()
        print("finish test 14")
    }
    static func testSemaphore2() {
        DispatchQueue.global().async {
            doWork()
        }
        DispatchQueue.global().async {
            doWork()
        }
        DispatchQueue.global().async {
            doWork()
        }
    }
}
