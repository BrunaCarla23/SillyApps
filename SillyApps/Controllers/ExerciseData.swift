//
//  ExerciseData.swift
//  SillyApps
//
//  Created by sinahk on 2/7/19.
//  Copyright © 2019 sinakhodadad. All rights reserved.
//

import Foundation
import UIKit

class ExerciseData{
    
    var exercises: [Exercise]!
    var image: [UIImage] = [
        UIImage.init(named: "WellDone.jpg")!,
        UIImage.init(named: "WellDone.jpg")!,
        UIImage.init(named: "WellDone.jpg")!,
        UIImage.init(named: "WellDone.jpg")!,
        UIImage.init(named: "WellDone.jpg")!,
        UIImage.init(named: "WellDone.jpg")!,
        UIImage.init(named: "WellDone.jpg")!,
        UIImage.init(named: "WellDone.jpg")!,
        UIImage.init(named: "WellDone.jpg")!
    ]
    
    init() {
        exercises = []
        
        let pause = Exercise(title: "pause", image: image[0])
        let ex1 = Exercise(title: "Jumping", image: image[1])
        exercises.append(ex1)
        exercises.append(pause)
        
        let ex2 = Exercise(title: "WallSit", image: image[2])
        exercises.append(ex2)
        exercises.append(pause)
        
        let ex3 = Exercise(title: "Crunch", image: image[3])
        exercises.append(ex3)
        exercises.append(pause)
        
        let ex4 = Exercise(title: "Stepup", image: image[4])
        exercises.append(ex4)
        exercises.append(pause)
        
        let ex5 = Exercise(title: "Stepup2", image: image[5])
        exercises.append(ex5)
        exercises.append(pause)
        
        let ex6 = Exercise(title: "Stepup3", image: image[6])
        exercises.append(ex6)
        exercises.append(pause)
        
        let ex7 = Exercise(title: "Stepup4", image: image[7])
        exercises.append(ex7)
        exercises.append(pause)
        
        let ex8 = Exercise(title: "Finish", image: image[8])
        exercises.append(ex8)
        
    }
    
    func getExercises() -> [Exercise]{
        return exercises
    }
    
}
