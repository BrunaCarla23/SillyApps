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
       UIImage.init(named: "red.jpg")!,
       UIImage.init(named: "Black.jpg")!
   ]

    init() {
        exercises = []
        
        let pause = Exercise(title: "break", image: image[0])
        
        for i in 1...49 {
            let ex1 = Exercise(title: "Continue", image: image[1])
            exercises.append(ex1)
            exercises.append(pause)
        }
        
        let ex8 = Exercise(title: "Finish", image: image[1])
        exercises.append(ex8)
        
    }
    
    func getExercises() -> [Exercise]{
        return exercises
    }
    
}
