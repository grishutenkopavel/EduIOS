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
    func testIdentityMatrixCreation(){
        let m = Matrix(identityMatrixWithSize: 4)
        XCTAssertEqual(m.matrix!, [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]])
    }
    func testNullMatrixCreation(){
        let m = Matrix(nullMatrixWithSizeRow: 3, column: 5)
        m.show()
        XCTAssertEqual(m.matrix!, [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]])
    }
    func testTranspose(){
        let m = try? Matrix(twoDimensionalArray: [[4, 3, -6], [2,-3, -4], [-9, 3, -6]])
        m?.transpose()
        XCTAssertEqual(m!.matrix!, [[4, 2, -9], [3,-3, 3], [-6, -4, -6]])
        
    }
    func testPerformanceExample() throws {
        measure {
            let getRandom: () -> Double = {
                return Double(arc4random() % 20)
            }
            for _ in 1...500{
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

}
