//
//  ButtonView.swift
//  RealGymApplication
//
//  Created by Daniel Ordaz on 8/28/24.
//

import SwiftUI

struct ButtonView: View {
    
    var Name: String
    
    var body: some View {
        Text(Name)
            .frame(width:350, height: 60)
            .background(Color.black)
            .foregroundStyle(Color.white)
            .cornerRadius(15)
            .font(.title2)
            .fontWeight(.semibold)
            .scaledToFit()
            .minimumScaleFactor(0.6)
    }
}

#Preview {
    ButtonView(Name: "Test")
}
