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
    
    //инициализация единичной матрицы
    init(identityMatrixWithSize size: Int){
        matrix = Array(repeating: Array(repeating: 0, count: size), count: size)
        for i in 0..<matrix!.count {
            for j in 0..<matrix![i].count {
                if i == j {
                    matrix![i][j] = 1
                }
            }
        }
    }
    //инициализация нулевой матрицы
    init(nullMatrixWithSizeRow row: Int, column: Int){
        matrix = Array(repeating: Array(repeating: 0, count: column), count: row)
    }
    //умножение
    func matmul(anotherMatrix: Matrix) throws -> Matrix {
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
    func add(anotherMatrix: Matrix) -> Matrix {
        
        var resultMatrix: [[Double]] = matrix!
        
        for i in 0..<matrix!.count {
            for j in 0..<matrix![i].count {
                resultMatrix[i][j] += anotherMatrix.matrix![i][j]
            }
        }
        
        return try! Matrix(twoDimensionalArray: resultMatrix)
    }
    //вычитание
    func sub(anotherMatrix: Matrix) -> Matrix {
        var resultMatrix: [[Double]] = matrix!
        
        for i in 0..<matrix!.count {
            for j in 0..<matrix![i].count {
                resultMatrix[i][j] -= anotherMatrix.matrix![i][j]
            }
        }
        
        return try! Matrix(twoDimensionalArray: resultMatrix)
    }
    
    //транспонирование
    func transpose() {
        var newMatrix = Array(repeating: Array(repeating: 0.0, count: matrix!.count), count: matrix![0].count)
        for i in 0..<newMatrix.count {
            for j in 0..<newMatrix[i].count {
                newMatrix[i][j] = matrix![j][i]
            }
        }
        matrix = newMatrix
    }
    
    //обратная матрица
    
    //определитель
    private func det(matrix: [[Double]]) -> Double {
        var result = 0.0
        if matrix.count == 1 && matrix[0].count == 1{
            result = matrix[0][0]
        }
        else if matrix.count == 2 && matrix[0].count == 2 {
            result = matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0]
        } else {
            var newMatrix = Array(repeating: Array(repeating: 0.0,
                                                   count: matrix[0].count - 1),
                                  count: matrix.count - 1)
            for i in 0..<matrix[0].count {
                
                var x = 1
                for newMatrixX in 0..<newMatrix.count{
                    
                    var y = 0
                    for newMatrixY in 0..<newMatrix[0].count{
                        if i == y {
                            y += 1;
                        }
                        newMatrix[newMatrixX][newMatrixY] = matrix[x][y]
                        y += 1;
                    }
                    x += 1;
                }
                let sum = matrix[0][i] * det(matrix: newMatrix)
                if i % 2 == 1{
                    result += (-1) * sum
                } else {
                    result += sum
                }
            }
        }
        return result
    }
    func determinant() -> Double {
        return det(matrix: self.matrix!)
    }
    //ранк
    func rank() -> Int {
        
        var rank = 0
        for k in 1...min(matrix!.count, matrix![0].count){
            var minor = Array(repeating: Array(repeating: 0.0, count: k), count: k)
            
            for i in 0..<minor.count {
                for j in 0..<minor[i].count {
                    
                    minor[i][j] = matrix![i][j]
                    
                }
            }
            if det(matrix: minor) != 0{
                rank += 1
            }
        }
        
        return rank
    }
    //проверка на равенство
    func eq(anotherMatrix: Matrix) -> Bool {
        var eq = true
        if self.matrix!.count != anotherMatrix.matrix!.count ||
            self.matrix![0].count != anotherMatrix.matrix![0].count{
            eq = false
            return eq
        }
        for i in 0..<self.matrix!.count{
            for j in 0..<self.matrix![i].count{
                if self.matrix![i][j] != anotherMatrix.matrix![i][j]{
                    eq = false
                    return eq
                }
            }
        }
        return eq
    }
    
    func show(){
        for arrIndex in matrix! {
            for number in arrIndex {
                print(number, terminator: " ")
            }
            print()
        }
    }
}
