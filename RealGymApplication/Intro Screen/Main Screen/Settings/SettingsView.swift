//
//  SettingsView.swift
//  RealGymApplication
//
//  Created by Daniel Ordaz on 8/28/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var Units: Bool
    
    var body: some View {
        
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            VStack{
                WorkoutTitleView(Padding: 50, text: "Settings")
                
                
                Button(action: {
                    
                }, label: {
                    Toggle(isOn: $Units) {
                        Text(Units ? "Kg Units" : "Lbs Units")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .scaledToFit()
                            .minimumScaleFactor(0.6)
                            .foregroundStyle(Color.black)
                        
                    }
                    .frame(width:350)
                })
                
                Spacer()
                
                DumbbellView()
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    SettingsView(Units: .constant(true))
}
