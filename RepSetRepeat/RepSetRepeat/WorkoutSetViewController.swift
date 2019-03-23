//
//  ViewController.swift
//  RepSetRepeat
//
//  Created by Leonardo Gonzalez on 3/21/19.
//  Copyright © 2019 Leonardo Gonzalez. All rights reserved.
//

import UIKit
import Alamofire

class WorkoutSetViewController: UIViewController, UITextFieldDelegate {
    var button = dropDownBtn()
    
    @IBOutlet weak var setText: UITextField!
    @IBOutlet weak var repText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var exerciseIdText: UITextField!
    @IBOutlet weak var workoutIdText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button = dropDownBtn.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.setTitle("Exercises", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        button.dropView.dropDownOptions = ["Axe Hold: 1", "Barbell Triceps Extension: 2", "Bench Press Narrow Grip: 3", "Biceps Curl With Cable: 4", "Biceps Curls With Barbell: 5", "Biceps Curls With Dumbbell: 6", "Biceps Curls With SZ-bar: 7", "Body-Ups: 8", "Close-grip Bench Press: 9", "Deadhang: 10", "Dips: 11", "Dips Between Two Benches: 12", "Dumbbell Concentration Curl: 13", "Dumbbell Incline Curl: 14", "Dumbbell Triceps Extension: 15", "Dumbbells on Scott Machine: 16", "French Press (skullcrusher) Dumbbells: 17", "French Press (skullcrusher) SZ-bar: 18", "Hammercurls: 19", "Hammercurls on Cable: 20", "Hand Grip: 21", "Hercules Pillars: 22", "Military Press: 23", "Pike Push Ups: 24", "Preacher Curls: 25", "Push Ups: 26", "Reverse Bar Curl: 27", "Ring Dips: 28", "Seated Triceps Press: 29", "Single-arm Preacher Curl: 30", "Smith Machine Close-grip Bench Press: 31", "Standing Rope Forearm: 32", "Tricep Dumbbell Kickback: 33", "Triceps Bench Press One Barbell: 34", "Triceps Dips: 35", "Triceps Extensions on Cable: 36", "Triceps Extensions on Cable With Bar: 37", "Triceps Machine: 38", "Wall Pushup: 39", "Z Curls: 40", "Barbell Hack Squats: 41", "Barbell Lunges: 42", "Braced Squat: 43", "Bulgarian Split Squat: 44", "Stationary Bike: 72", "Dumbbell Goblet Squat: 45", "Dumbbell Lunges Standing: 46", "Dumbbell Lunges Walking: 47", "Front Squats: 48", "Glute Bridge: 49", "Good Mornings: 50", "High Knee Jumps: 51", "High Knees: 52", "Jogging: 53", "Kettlebell Swings: 54", "Leg Curls (laying): 55", "Leg Curls (sitting): 56", "Leg Curls (standing): 57", "Leg Extension: 58", "Leg Press on Hackenschmidt Machine: 59", "Leg Presses (narrow): 60", "Leg Presses (wide): 61", "Low Box Squat - Wide Stance: 62", "Overhead Squat: 63", "Pistol Squat: 64", "Romanian Deadlift: 65", "Run: 66", "Run - Interval Training : 67", "Run - Treadmill: 68", "Speed Deadlift: 69", "Squat Jumps: 70", "Squats: 71", "Stiff-legged Deadlifts: 73", "Thruster: 74", "Wall Squat: 75", "Weighted Step: 76", "Weighted Step-ups: 77", "2 Handed Kettlebell Swing: 78", "Barbell Ab Rollout: 79", "Cable Woodchoppers: 80", "Crunches: 81", "Crunches With Cable: 82", "Crunches With Legs Up: 83", "Crunches on Machine: 84", "Flutter Kicks: 85", "Full Sit Outs: 86", "Hanging Leg Raises: 87", "Hollow Hold: 88", "Incline Plank With Alternate Floor Touch: 89", "L Hold: 90", "Leg Raises, Lying: 91", "Leg Raises, Standing: 92", "Negative Crunches: 93", "Overhand Cable Curl: 94", "Plank: 95", "Reverse Plank: 96", "Roman Chair: 97", "Side Crunch: 98", "Side Plank: 99", "Sit-ups: 100", "Splinter Sit-ups: 101", "Trunk Rotation With Cable : 102", "Turkish Get-Up: 103", "Bear Walk: 104", "Bear Walk: 105", "Bench Press: 106", "Benchpress Dumbbells: 107", "Burpees: 108", "Butterfly: 109", "Butterfly Narrow Grip: 110", "Cable Cross-over: 111", "Cross-Bench Dumbbell Pullovers: 112", "Decline Bench Press Barbell: 113", "Decline Bench Press Dumbbell: 114", "Decline Pushups: 115", "Extenseurs - Face: 116", "Fly With Cable: 117", "Bent High Pulls: 166", "Fly With Dumbbells: 118", "Fly With Dumbbells, Decline Bench: 119", "Incline Bench Press: 120", "Incline Dumbbell Flye: 121", "Incline Dumbbell Press: 122", "Incline Pushups: 123", "Isometric Wipers: 124", "Leverage Machine Chest Press: 125", "Pause Bench: 126", "Perfect Push Up: 127", "Reverse Grip Bench Press: 128", "Side to Side Push Ups: 129", "Upper Body: 130", "Upper External Oblique: 131", "Bent Over Barbell Row: 132", "Bent Over Rowing: 133", "Bent Over Rowing Reverse: 134", "Bentover Dumbbell Rows: 135", "Chin-ups: 136", "Close-grip Lat Pull Down: 137", "Deadlifts: 138", "Superman: 161", "Underhand Lat Pull Down: 162", "V-Bar Pulldown: 163", "Wide-grip Pulldown: 164", "Deficit Deadlift: 139", "Hip Raise, Lying: 140", "Hyperextensions: 141", "Incline Dumbbell Row: 142", "Lat Pull Down (Leaning Back): 143", "Lat Pull Down (Straight Back): 144", "Leverage Machine Iso Row: 145", "Long-Pulley (low Row): 146", "Long-Pulley, Narrow: 147", "MGM Machine: 148", "Pendelay Rows: 149", "Prone Scapular Retraction - Arms at Side: 150", "Pull Ups on Machine: 151", "Pull-ups: 152", "Rack Deadlift: 153", "Rowing, Lying on Bench: 154", "Rowing, Seated: 155", "Rowing, T-bar: 156", "Shotgun Row: 157", "Side Dumbbell Trunk Flexion: 158", "Straight-arm Pull Down (bar Attachment): 159", "Straight-arm Pull Down (rope Attachment): 160", "Arnold Shoulder Press: 165", "Bent-over Lateral Raises: 167", "Butterfly Reverse: 168", "Cable External Rotation: 169", "Diagonal Shoulder Press: 170", "Facepull: 171", "Front Raises: 172", "High Pull: 173", "Lateral Raises: 174", "Lateral Raises on Cable, One Armed: 175", "Lateral-to-Front Raises: 176", "Lying Rotator Cuff Exercise: 177", "Military Press: 178", "Power Clean: 179", "Push Press: 180", "Rear Delt Raises: 181", "Shoulder Press, Barbell: 182", "Shoulder Press, Dumbbells: 183", "Shoulder Press, on Machine: 184", "Shoulder Press, on Multi Press: 185", "Shrugs, Barbells: 186", "Shrugs, Dumbbells: 187", "Side Raise: 188", "Side-lying External Rotation: 189", "Snach: 190", "Upright Row w/ Dumbbells: 191", "Upright Row, SZ-bar: 192", "Upright Row, on Multi Press: 193", "Wall Handstand: 194", "Calf Press Using Leg Press Machine: 195", "Calf Raises on Hackenschmitt Machine: 196", "Sitting Calf Raises: 197", "Skipping - Standard: 198", "Standing Calf Raises: 199"]
    }
    
    
    
    @IBAction func submitTapped(_ sender: Any) {
        if (setText.text?.isEmpty)! ||
           (repText.text?.isEmpty)! ||
           (weightText.text?.isEmpty)! ||
           (exerciseIdText.text?.isEmpty)! ||
           (workoutIdText.text?.isEmpty)!
        {
            return
        }
        
        let url =  "https://rep-set-repeat.herokuapp.com/api/workout_sets"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTUxODg3NDh9.zsPjtdyaWHdmT_P5LU3xbV0jlelQB21-rPd__QIkh5E",
            "Content-Type": "application/json"
        ]
        
        let parameters: [String: Any] = [
                                      "groups": setText.text!,
                                      "reps": repText.text!,
                                      "weight": weightText.text!,
                                      "exercise_id": exerciseIdText.text!,
                                      "workout_id": workoutIdText.text!
            ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<600)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    if let data = response.data {
                        print("Print Server Error: " + String(data: data, encoding: String.Encoding.utf8)!)
                    }
                    print(error)
                    
                case .success(let value):
                    
                    print(value)
                }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
}

class dropDownBtn: UIButton {
    func dropDownPressed() {
        self.dismissDropDown()
    }
    
    var dropView = dropDownView()
    
    var height = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
        
        dropView = dropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        
        dropView.translatesAutoresizingMaskIntoConstraints = false
    
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            
            if self.dropView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            } else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            
            
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                    self.dropView.layoutIfNeeded()
                    self.dropView.center.y += self.dropView.frame.height / 2
                }, completion: nil)
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class dropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
    var dropDownOptions = [String]()
    
    var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.backgroundColor = UIColor.darkGray
        self.backgroundColor = UIColor.darkGray
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.backgroundColor = UIColor.darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dropDownOptions[indexPath.row])
    }
}
