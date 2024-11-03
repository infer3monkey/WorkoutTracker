//
//  WorkoutTitleView.swift
//  RealGymApplication
//
//  Created by Daniel Ordaz on 8/28/24.
//

import SwiftUI

struct WorkoutTitleView: View {
    
    var Padding: CGFloat
    var text: String
    
    var body: some View {
        Text(text)
            .frame(width:450, height: 40)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.semibold)
            .scaledToFit()
            .minimumScaleFactor(0.6)
            .foregroundStyle(Color.black)
            .padding(.bottom, Padding)
    }
}

#Preview {
    WorkoutTitleView(Padding: 25, text: "One Rep Max Calculator")
}
