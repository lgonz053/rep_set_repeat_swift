//
//  File.swift
//  RepSetRepeat
//
//  Created by Leonardo Gonzalez on 3/21/19.
//  Copyright © 2019 Leonardo Gonzalez. All rights reserved.
//

import Foundation

import UIKit
import Alamofire

struct Workout {
    let id: Int
    let timeLimit: String
    let muscleGroup: String
    
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ?? -1
//        timeLimit = json["time_limit"] as? String ?? ""
//        muscleGroup = json["muscle_group"] as? String ?? ""
//    }
}

class WorkoutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url =  "https://rep-set-repeat.herokuapp.com/api/workouts"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTUwMTEwMTB9.twjQUpM6LFeo7YRQSw53Jp1aqltXmcagrCwHY5eIex8",
            "Accept": "application/json"
        ]
        
        Alamofire.request(url, method: .get, headers: headers).responseJSON(completionHandler: { (response) in
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        })
    }
}

