//
//  Matrix.swift
//  matrix
//
//  Created by Павел Гришутенко on 31.07.2021.
//

import Foundation

enum MatrixError : Error {
    case RowAndColumnDifferent
    case notEnoughValuesInARow
}

class Matrix {
    var matrix: [[Double]]?
    
    init(twoDimensionalArray: [[Double]]) throws {
        for i in 0..<twoDimensionalArray.count {
            guard twoDimensionalArray[0].count == twoDimensionalArray[i].count else {
                throw MatrixError.notEnoughValuesInARow
            }
        }
        
        matrix = twoDimensionalArray
        
    }
    
    //умножение
    func matmul(anotherMatrix: Matrix) throws -> Matrix{
        for i in 0..<anotherMatrix.matrix!.count {
            guard self.matrix!.count == anotherMatrix.matrix![i].count else {
                throw MatrixError.RowAndColumnDifferent
            }
        }
        var resultMatrix: [[Double]] = Array(repeating: Array(repeating: 0,
                                                              count: matrix![0].count),
                                             count: matrix!.count)
        
        for i in 0..<self.matrix!.count {
            for j in 0..<self.matrix![i].count {
                for k in 0..<self.matrix![0].count {
                    resultMatrix[i][j] += self.matrix![i][k] * anotherMatrix.matrix![k][j]
                }
            }
        }
        
        return try! Matrix(twoDimensionalArray: resultMatrix)
    }
    //сложение
    func add(anotherMatrix: Matrix)-> Matrix{
        
        var resultMatrix: [[Double]] = matrix!
        
        for i in 0..<matrix!.count {
            for j in 0..<matrix![i].count {
                resultMatrix[i][j] += anotherMatrix.matrix![i][j]
            }
        }
        
        return try! Matrix(twoDimensionalArray: resultMatrix)
    }
    //вычитание
    func sub(anotherMatrix: Matrix)-> Matrix{
        var resultMatrix: [[Double]] = matrix!
        
        for i in 0..<matrix!.count {
            for j in 0..<matrix![i].count {
                resultMatrix[i][j] -= anotherMatrix.matrix![i][j]
            }
        }
        
        return try! Matrix(twoDimensionalArray: resultMatrix)
    }
    //ранк
    //транспонирование
    
    //обратная матрица
    //инициализация квадратной матрицы
    //инициализация нулевой матрицы
    //проверка на равенство
    //проверка на симметрию
    func show(){
        for arrIndex in matrix! {
            for number in arrIndex {
                print(number, terminator: " ")
            }
            print()
        }
    }
}
