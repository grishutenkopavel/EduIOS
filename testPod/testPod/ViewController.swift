//
//  ViewController.swift
//  testPod
//
//  Created by Павел Гришутенко on 23.08.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = AF.request("https://swapi.dev/api/films")
        request.responseJSON { data in
            print(data)
        }
    }


}

