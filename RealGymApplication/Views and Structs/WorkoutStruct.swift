//
//  WorkoutStruct.swift
//  RealGymApplication
//
//  Created by Daniel Ordaz on 9/1/24.
//

import Foundation
import SwiftUI

struct WorkoutLog: Hashable, Identifiable{
    let id =  UUID()
    var workoutNum: Int
    var workoutText: String
    var Exercises: [WorkoutStruct]
    //var initialized: Bool
}

struct WorkoutStruct: Hashable, Identifiable{
    let id =  UUID()
    var text: String
    var Sets: [SetStruct]
    var SetsCount: Int
    var newSet: Bool
}

struct SetStruct: Hashable, Identifiable{
    let id =  UUID()
    var weight: String
    var reps: String
}

struct WorkoutTracker {

}

struct mockData {
    
    static let basicSet = SetStruct(weight: "0", reps: "0")
    
    static let SampleExercise = [WorkoutStruct(text: "Workout Name", Sets: SampleSets, SetsCount: 3, newSet: false)]
    
    
    static let SampleSets = [SetStruct(weight: "0", reps: "0"), SetStruct(weight: "0", reps: "0"), SetStruct(weight: "0", reps: "0")]
    
    static let WorkoutLogs = [WorkoutLog(workoutNum: 1,
                                         workoutText: "New Workout",
                                         Exercises: SampleExercise),
                              WorkoutLog(workoutNum: 2,
                                        workoutText: "New Workout",
                                         Exercises: SampleExercise),
                              WorkoutLog(workoutNum: 3,
                                        workoutText: "New Workout",
                                         Exercises: SampleExercise),
                              WorkoutLog(workoutNum: 4,
                                        workoutText: "New Workout",
                                         Exercises: SampleExercise)]
    
    static let SampleWorkout = WorkoutLog(workoutNum: 1,
                                          workoutText: "New Workout",
                                          Exercises: SampleExercise)
    
}

struct RealData {
    var EmptyWorkoutLog: [WorkoutLog] 
}
