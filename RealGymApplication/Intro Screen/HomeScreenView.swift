//
//  HomeScreenView.swift
//  RealGymApplication
//
//  Created by Daniel Ordaz on 8/28/24.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                
                MultiCircleView()
                
                HomePageView()
            }
        }
    }
}

struct HomePageView: View {
    
    @State var WorkoutLogData = [mockData.SampleWorkout]
    @State var properUnits = true
    
    var body: some View {
        VStack{
            Spacer()
            
            WorkoutTitleView(Padding: 25, text: "Workout Tracker")
            
            DumbbellView()
                
            NavigationLink(destination: MainScreenView(WorkoutLogData: $WorkoutLogData,
                                                       properUnits: $properUnits).navigationBarBackButtonHidden(true)){
                Text("Enter")
                    .frame(width:220, height: 55)
                    .background(Color.black)
                    .foregroundStyle(Color.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .cornerRadius(15)
                    .padding(.top, 45)
            }
            
            
            Spacer()
        }
    }
}

struct MultiCircleView: View {
    var body: some View {
        CircleView(Scale: 1.5, Opacity: 0.15)
        CircleView(Scale: 1.3, Opacity: 0.3)
        CircleView(Scale: 1.1, Opacity: 0.45)
        CircleView(Scale: 0.9, Opacity: 0.6)
    }
}

struct CircleView: View {
    var Scale: Double
    var Opacity: Double
    
    var body: some View {
        Circle()
            .scale(Scale)
            .foregroundStyle(Color.white.opacity(Opacity))
    }
}

#Preview {
    HomeScreenView()
}
