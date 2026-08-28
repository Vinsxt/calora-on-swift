//
//  ForLoops.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 28/08/26.
//

import Foundation
import Playgrounds

#Playground {
    for item in 0..<100 { // basically 0 to 99 - 100 times.
        print(item)
    }
    
    let myArray = ["Alpha", "Beta", "Gamma", "Delta", "Epsilon"]
    
    var secondArray: [String] = []
    
    for item in myArray { // item is basically you name any variable you want.
        print(item)
        
        if item == "Gamma" {
            secondArray.append(item)
        }
            
    }
    
    print(secondArray)
    
    struct LessonModel {
        let title: String
        let isFavorite: Bool
    }
    
    let allLessons = [
        LessonModel(title: "Lesson 1", isFavorite: true),
        LessonModel(title: "Lesson 2", isFavorite: false),
        LessonModel(title: "Lesson 3", isFavorite: false),
        LessonModel(title: "Lesson 4", isFavorite: true)
        
    ]
    
    var favoriteLesson: [LessonModel] = []
    
    for lesson in allLessons{
        if lesson.isFavorite {
            favoriteLesson.append(lesson)
        }
    }
    
    // to have the indexes (n, x) n -> index | x -> value of that index
    for (index, lesson) in allLessons.enumerated() {
        
        if index == 1 {
            break
        }
        
        print("index: \(index) | lesson: \(lesson)")
    }
}
