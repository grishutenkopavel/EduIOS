//
//  matrixTests.swift
//  matrixTests
//
//  Created by Павел Гришутенко on 02.08.2021.
//

import XCTest
@testable import matrix
class MatrixTests: XCTestCase {


    func testMatrixComposition() {

        let m1 = try? Matrix(twoDimensionalArray: [[4, 3, -6], [2,-3, -4], [-9, 3, -6]])
        let m2 = try? Matrix(twoDimensionalArray: [[1, 2, -4], [-6, 9, 2], [-4, 5, 1]])
        let resMat = try? m1?.matmul(anotherMatrix: m2!)
        XCTAssertEqual(resMat!.matrix, [[10.0, 5.0, -16.0], [36.0, -43.0, -18.0], [-3.0, -21.0, 36.0]], "error")
        
    }
    
    func testPerformanceExample() throws {
        measure {
            let getRandom: () -> Double = {
                return Double(arc4random() % 20)
            }
            let m1 = try? Matrix(twoDimensionalArray: [[getRandom(), getRandom(), getRandom()],
                                                       [getRandom(), getRandom(), getRandom()],
                                                       [getRandom(), getRandom(), getRandom()]])
            let m2 = try? Matrix(twoDimensionalArray: [[getRandom(), getRandom(), getRandom()],
                                                       [getRandom(), getRandom(), getRandom()],
                                                       [getRandom(), getRandom(), getRandom()]])
            let resMat = try? m1?.matmul(anotherMatrix: m2!)
            resMat?.show()
        }
    }

}
