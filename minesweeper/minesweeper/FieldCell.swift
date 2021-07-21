//
//  FieldCell.swift
//  minesweeper
//
//  Created by Павел Гришутенко on 16.07.2021.
//

import Foundation

struct FieldCell{
    var isMine:Bool = false
    var isOpen:Bool = false
    var countOfMinesAround:Int = 0
}
