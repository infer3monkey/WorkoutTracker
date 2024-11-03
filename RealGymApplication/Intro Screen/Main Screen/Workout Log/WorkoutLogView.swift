//
//  WorkoutLogView.swift
//  RealGymApplication
//
//  Created by Daniel Ordaz on 8/28/24.
//

import SwiftUI

struct WorkoutLogView: View {
    
    //@Binding var realData: [WorkoutLog]
    @Binding var realData: [WorkoutLog]
    @State var count = 1
    
    var units: Bool
    
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                VStack{
                    WorkoutTitleView(Padding: 50, text: "Workout Log")
                    
                    ScrollView{
                        
                        ForEach($realData) { $Workout in
                            NavigationLink(destination: NewWorkoutView(
                                workoutLog: $Workout, Units: units)) {
                                    ButtonView(Name: "Workout \(Workout.workoutNum)")
                            }
                        }
                        
                        Button(action: {
                            //let num = realData.count + 1
                            realData.append(WorkoutLog(workoutNum: realData.count + 1,
                                                           workoutText: "New Workout",
                                                       Exercises: mockData.SampleExercise))
                            //currentNum = currentNum + 1
                        }, label: {
                            ButtonView(Name: "New Workout")
                        })
                        
                    }
                    .frame(height: 400)
                    
                    Spacer()
                    
                    DumbbellView()
                    
                    Spacer()
                }
            }
        }
    }
}


#Preview {
    //WorkoutLogView(realData: .constant(mockData.WorkoutLogs))
    WorkoutLogView(realData: .constant([WorkoutLog(workoutNum: 1, workoutText: "New Workout",Exercises: mockData.SampleExercise)]), units: true)
}
