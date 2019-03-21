//
//  ViewController.swift
//  RepSetRepeat
//
//  Created by Leonardo Gonzalez on 3/21/19.
//  Copyright © 2019 Leonardo Gonzalez. All rights reserved.
//

import UIKit
import Alamofire

class WorkoutSetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url =  "https://rep-set-repeat.herokuapp.com/api/workouts"
        let headers: HTTPHeaders = [
                                    "Authorization": ,
                                    "Accept": "application/json"
                                    ]
        
        Alamofire.request(url, method: .get, headers: headers).responseJSON {
            response in debugPrint(response)
        }
    }
}

