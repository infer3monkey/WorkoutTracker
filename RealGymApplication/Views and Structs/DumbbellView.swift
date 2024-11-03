//
//  DumbbellView.swift
//  RealGymApplication
//
//  Created by Daniel Ordaz on 8/28/24.
//

import SwiftUI

struct DumbbellView: View {
    var body: some View {
        Image(systemName: "dumbbell.fill")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:200, height:100)
            .foregroundStyle(Color.black)
    }
}

#Preview {
    DumbbellView()
}
