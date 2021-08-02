//
//  ViewController.swift
//  matrix
//
//  Created by Павел Гришутенко on 31.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        do {
            let m1 = try Matrix(twoDimensionalArray: [[4, 3, -6], [2,-3, -4], [-9, 3, -6]])
            let m2 = try Matrix(twoDimensionalArray: [[1, 2, -4], [-6, 9, 2], [-4, 5, 1]])
            let resmat = try m1.matmul(anotherMatrix: m2)
            resmat.show()
        } catch MatrixError.notEnoughValuesInARow{
            print("err")
        } catch{
            print("err2")
        }
        
    }


}

