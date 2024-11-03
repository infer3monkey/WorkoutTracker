//
//  ORMCalcView.swift
//  RealGymApplication
//
//  Created by Daniel Ordaz on 8/28/24.
//

import SwiftUI
import UIKit
import Darwin
import Foundation

struct ORMCalcView: View {
    
    @State private var WeightUsed = 0.0
    @State private var RepsDone = 0.0
    var Units: Bool
    @State private var ORMCalc = "0"
    
    var body: some View {
        
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            VStack{
                WorkoutTitleView(Padding: 50, text: "One Rep Max Calculator")
                Text("Weight Used")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
                    .foregroundStyle(Color.black)
                
                HStack{
                    TextField("", value: $WeightUsed, formatter: NumberFormatter(), onCommit:{
                        //code here doing the calculations
                        let calc1 = RepsDone*2.5
                        let calc2 = 100.0-calc1
                        let calc3 = calc2/100.0
                        let calc4 = WeightUsed/calc3
                        let answer = round(calc4*10.0)/10.0
                        
                        ORMCalc = "\(answer)"
                    })
                    .frame(alignment: .center)
                    .multilineTextAlignment(.center)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.black)
                    .frame(width:50)
                    .background(.black.opacity(0.2))
                    
                    Text(Units ? "kg" : "lbs")
                        .frame(alignment: .center)
                        .multilineTextAlignment(.center)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color.black)
                }
                
                
                    
                
                Text("Reps Done")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
                    .foregroundStyle(Color.black)
                
                HStack{
                    TextField("Reps Done", value: $RepsDone, formatter: NumberFormatter(), onCommit:{
                        //code here doing the calculations
                        let calc1 = RepsDone*2.5
                        let calc2 = 100.0-calc1
                        let calc3 = calc2/100.0
                        let calc4 = WeightUsed/calc3
                        let answer = round(calc4*10.0)/10.0
                        
                        ORMCalc = "\(answer)"
                    })
                    .frame(alignment: .center)
                    .multilineTextAlignment(.center)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.black)
                    .frame(width:50)
                    .background(.black.opacity(0.2))
                    
                    Text("Reps")
                        .frame(alignment: .center)
                        .multilineTextAlignment(.center)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color.black)
                }
                
                Text("Estimated One Rep Max")
                    .font(.title)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
                    .padding(.top, 50)
                    .foregroundStyle(Color.black)
                
                HStack{
                    Text(ORMCalc)
                        .frame(alignment: .center)
                        .multilineTextAlignment(.center)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color.black)
                    Text(Units ? "kg" : "lbs")
                        .frame(alignment: .center)
                        .multilineTextAlignment(.center)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color.black)
                }
                .padding(.top, 10)
                
                
                Spacer()
                
                DumbbellView()
                
                Spacer()
            }
        }
    }
}

#Preview {
    ORMCalcView(Units: false)
}
