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
    var button = dropDownBtn()
    
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
        
        button.dropView.dropDownOptions = ["Axe Hold", "Barbell Triceps Extension", "Bench Press Narrow Grip", "Biceps Curl With Cable", "Biceps Curls With Barbell", "Biceps Curls With Dumbbell", "Biceps Curls With SZ-bar", "Body-Ups", "Close-grip Bench Press", "Deadhang", "Dips", "Dips Between Two Benches", "Dumbbell Concentration Curl", "Dumbbell Incline Curl", "Dumbbell Triceps Extension", "Dumbbells on Scott Machine", "French Press (skullcrusher) Dumbbells", "French Press (skullcrusher) SZ-bar", "Hammercurls", "Hammercurls on Cable", "Hand Grip", "Hercules Pillars", "Military Press", "Pike Push Ups", "Preacher Curls", "Push Ups", "Reverse Bar Curl", "Ring Dips", "Seated Triceps Press", "Single-arm Preacher Curl", "Smith Machine Close-grip Bench Press", "Standing Rope Forearm", "Tricep Dumbbell Kickback", "Triceps Bench Press One Barbell", "Triceps Dips", "Triceps Extensions on Cable", "Triceps Extensions on Cable With Bar", "Triceps Machine", "Wall Pushup", "Z Curls", "Barbell Hack Squats", "Barbell Lunges", "Braced Squat", "Bulgarian Split Squat", "Dumbbell Goblet Squat", "Dumbbell Lunges Standing", "Dumbbell Lunges Walking", "Front Squats", "Glute Bridge", "Good Mornings", "High Knee Jumps", "High Knees", "Jogging", "Kettlebell Swings", "Leg Curls (laying)", "Leg Curls (sitting)", "Leg Curls (standing)", "Leg Extension", "Leg Press on Hackenschmidt Machine", "Leg Presses (narrow)", "Leg Presses (wide)", "Low Box Squat - Wide Stance", "Overhead Squat", "Pistol Squat", "Romanian Deadlift", "Run", "Run - Interval Training ", "Run - Treadmill", "Speed Deadlift", "Squat Jumps", "Squats", "Stationary Bike", "Stiff-legged Deadlifts", "Thruster", "Wall Squat", "Weighted Step", "Weighted Step-ups", "2 Handed Kettlebell Swing", "Barbell Ab Rollout", "Cable Woodchoppers", "Crunches", "Crunches With Cable", "Crunches With Legs Up", "Crunches on Machine", "Flutter Kicks", "Full Sit Outs", "Hanging Leg Raises", "Hollow Hold", "Incline Plank With Alternate Floor Touch", "L Hold", "Leg Raises, Lying", "Leg Raises, Standing", "Negative Crunches", "Overhand Cable Curl", "Plank", "Reverse Plank", "Roman Chair", "Side Crunch", "Side Plank", "Sit-ups", "Splinter Sit-ups", "Trunk Rotation With Cable ", "Turkish Get-Up", "Bear Walk", "Bear Walk", "Bench Press", "Benchpress Dumbbells", "Burpees", "Butterfly", "Butterfly Narrow Grip", "Cable Cross-over", "Cross-Bench Dumbbell Pullovers", "Decline Bench Press Barbell", "Decline Bench Press Dumbbell", "Decline Pushups", "Extenseurs - Face", "Fly With Cable", "Fly With Dumbbells", "Fly With Dumbbells, Decline Bench", "Incline Bench Press", "Incline Dumbbell Flye", "Incline Dumbbell Press", "Incline Pushups", "Isometric Wipers", "Leverage Machine Chest Press", "Pause Bench", "Perfect Push Up", "Reverse Grip Bench Press", "Side to Side Push Ups", "Upper Body", "Upper External Oblique", "Bent Over Barbell Row", "Bent Over Rowing", "Bent Over Rowing Reverse", "Bentover Dumbbell Rows", "Chin-ups", "Close-grip Lat Pull Down", "Deadlifts", "Deficit Deadlift", "Hip Raise, Lying", "Hyperextensions", "Incline Dumbbell Row", "Lat Pull Down (Leaning Back)", "Lat Pull Down (Straight Back)", "Leverage Machine Iso Row", "Long-Pulley (low Row)", "Long-Pulley, Narrow", "MGM Machine", "Pendelay Rows", "Prone Scapular Retraction - Arms at Side", "Pull Ups on Machine", "Pull-ups", "Rack Deadlift", "Rowing, Lying on Bench", "Rowing, Seated", "Rowing, T-bar", "Shotgun Row", "Side Dumbbell Trunk Flexion", "Straight-arm Pull Down (bar Attachment)", "Straight-arm Pull Down (rope Attachment)", "Superman", "Underhand Lat Pull Down", "V-Bar Pulldown", "Wide-grip Pulldown", "Arnold Shoulder Press", "Bent High Pulls", "Bent-over Lateral Raises", "Butterfly Reverse", "Cable External Rotation", "Diagonal Shoulder Press", "Facepull", "Front Raises", "High Pull", "Lateral Raises", "Lateral Raises on Cable, One Armed", "Lateral-to-Front Raises", "Lying Rotator Cuff Exercise", "Military Press", "Power Clean", "Push Press", "Rear Delt Raises", "Shoulder Press, Barbell", "Shoulder Press, Dumbbells", "Shoulder Press, on Machine", "Shoulder Press, on Multi Press", "Shrugs, Barbells", "Shrugs, Dumbbells", "Side Raise", "Side-lying External Rotation", "Snach", "Upright Row w/ Dumbbells", "Upright Row, SZ-bar", "Upright Row, on Multi Press", "Wall Handstand", "Calf Press Using Leg Press Machine", "Calf Raises on Hackenschmitt Machine", "Sitting Calf Raises", "Skipping - Standard", "Standing Calf Raises"]
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
