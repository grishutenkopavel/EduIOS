//
//  FieldCell.swift
//  minesweeper
//
//  Created by Павел Гришутенко on 16.07.2021.
//

import Foundation
import UIKit

struct FieldCell{
    static var size: Int!
    var isMine: Bool = false
    var isOpen: Bool = true
    var isFlag: Bool = false
    var countOfMinesAround:Int = 0
    var point: CGPoint!
}
