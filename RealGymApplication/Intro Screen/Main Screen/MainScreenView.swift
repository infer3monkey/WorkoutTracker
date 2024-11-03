//
//  MainScreenView.swift
//  RealGymApplication
//
//  Created by Daniel Ordaz on 8/28/24.
//

import SwiftUI

struct MainScreenView: View {
    
    @Binding var WorkoutLogData: [WorkoutLog]
    @Binding var properUnits: Bool
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                VStack{
                    
                    WorkoutTitleView(Padding: 50, text: "Workout Tracker")
                    
                    NavigationLink(destination: WorkoutLogView(realData: $WorkoutLogData, units: properUnits)) {
                        ButtonView(Name: "Workout Log")
                    }
                    
                    NavigationLink(destination: ORMCalcView(Units: properUnits)){
                        ButtonView(Name: "One Rep Max Calculator")
                    }
                    
                    NavigationLink(destination: SettingsView(Units: $properUnits)){
                        ButtonView(Name: "Settings")
                    }
                    
                    Spacer()
                    
                    DumbbellView()
                    
                    Spacer()
                }
            }
        }
        
        
    }
}

#Preview {
    MainScreenView(WorkoutLogData: .constant([mockData.SampleWorkout]), properUnits: .constant(false))
}
