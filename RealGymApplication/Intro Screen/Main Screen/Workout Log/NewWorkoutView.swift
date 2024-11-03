//
//  NewWorkoutView.swift
//  RealGymApplication
//
//  Created by Daniel Ordaz on 8/31/24.
//

import SwiftUI

extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder
            .resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct NewWorkoutView: View {
    
    @Binding var workoutLog: WorkoutLog
    
    @State var EditMode = false //for the editing feature
    
    
    var Units: Bool
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    //WorkoutTitleView(Padding: 15, text: "Workout #\(workoutLog.workoutNum)")
                    Spacer()
                    
                    Text("Workout #\(workoutLog.workoutNum)")
                        .frame(width:250, height: 40)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .scaledToFit()
                        .minimumScaleFactor(0.6)
                        .foregroundStyle(Color.black)
                    
                    Button(action: {
                        EditMode.toggle()
                    }, label: {
                        Image(systemName: EditMode ? "pencil.circle.fill" : "pencil.circle")
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .foregroundStyle(EditMode ? .blue : .gray)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:40, height:40)
                            .padding(.trailing, 20)
                    })
                }
                
                
                ScrollView{
                    ForEach($workoutLog.Exercises){ $exercise in
                        
                        if (EditMode) {
                            
                            HStack {
                                
                                TextEditor(text: $exercise.text)
                                    .frame(width:300, height: 40)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .scaledToFit()
                                    .minimumScaleFactor(0.6)
                                    .foregroundStyle(Color.black)
                                    .scrollContentBackground(.hidden)
                                    .background(.black.opacity(0.2))
                                    
                                
                                Text("x")
                                    .frame(width:20, height: 30)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .scaledToFit()
                                    .minimumScaleFactor(0.6)
                                    .foregroundStyle(Color.black)
                                
                                TextField("Sets", value: $exercise.SetsCount, formatter: NumberFormatter(), onCommit:{
                                    
                                    if (exercise.Sets.count != exercise.SetsCount) {
                                        //then make as many sets as needed
                                        if(exercise.Sets.count <= exercise.SetsCount){
                                            //need to create more sets
                                            for _ in exercise.Sets.count+1...exercise.SetsCount {
                                                exercise.Sets.append(SetStruct(weight: "0", reps: "0"))
                                            }
                                        } else {
                                            //need to delete some sets
                                            for _ in exercise.SetsCount+1...exercise.Sets.count {
                                                exercise.Sets.removeLast()
                                            }
                                        }
                                    }
                                })
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.black)
                                .frame(width:25)
                                .background(.black.opacity(0.2))
                                .padding(.trailing, 20)
                                
                                //Spacer()
                            }
                            
                            
                        } else {
                            Text("\(exercise.text) x \(exercise.SetsCount)")
                                .frame(width:350, height: 30, alignment: .leading)
                                .font(.title)
                                .fontWeight(.bold)
                                .scaledToFit()
                                .minimumScaleFactor(0.6)
                                .foregroundStyle(Color.black)
                        }
                        
                        ForEach($exercise.Sets){ $Sets in
                            HStack{
                                
                                Spacer()
                                
                                if(EditMode) {
                                    Text("Weight: ")
                                        .frame(width:100, height: 30, alignment: .leading)
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .scaledToFit()
                                        .minimumScaleFactor(0.6)
                                        .foregroundStyle(Color.black)
                                    TextEditor(text: $Sets.weight)
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .frame(width:50, height: 30)
                                        .scrollContentBackground(.hidden)
                                        .background(.black.opacity(0.2))
                                        
                                    Text("Reps: ")
                                        .frame(width:100, height: 30, alignment: .leading)
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .scaledToFit()
                                        .minimumScaleFactor(0.6)
                                        .foregroundStyle(Color.black)
                                    
                                    TextEditor(text: $Sets.reps)
                                        .font(.title3)
                                        .foregroundStyle(Color.black)
                                        .frame(width:50, height: 30)
                                        .scrollContentBackground(.hidden)
                                        .background(.black.opacity(0.2))
                                    
                                } else {
                                    Text(Units ? "Weight: \(Sets.weight) kg" : "Reps: \(Sets.weight) lbs")
                                        .frame(width:200, height: 30, alignment: .leading)
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .scaledToFit()
                                        .minimumScaleFactor(0.6)
                                        .foregroundStyle(Color.black)
                                    
                                    Text("Reps: \(Sets.reps)")
                                        .frame(width:150, height: 20, alignment: .leading)
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .scaledToFit()
                                        .minimumScaleFactor(1)
                                        .foregroundStyle(Color.black)
                                }
                                
                                Spacer()
                            }
                        }
                    }
                }
                .frame(height: 450)
                .onTapGesture {
                    self.dismissKeyboard()
                }
                
                Button(action: {
                    //exercise.Sets.append(mockData.basicSet)
                    workoutLog.Exercises.append(WorkoutStruct(text: "Workout Name", Sets: [SetStruct(weight: "0", reps: "0"), SetStruct(weight: "0", reps: "0"), SetStruct(weight: "0", reps: "0")],SetsCount: 3, newSet: false))
                }, label: {
                    if(EditMode){
                        ButtonView(Name: "New Exercise")
                    }
                })
                .padding(.bottom, 30)
                
                
//                TextEditor(text: $workoutLog.workoutText)
//                    .font(.title2)
//                    .foregroundStyle(Color.black)
//                    .frame(height: 400)
//                    .padding(.leading, 50)
//                    .background(Color.white)
//                    .colorScheme(.light)
                
                    
                DumbbellView()
                Spacer()
            }
        }
        
    }
}

//func AppendWorkoutLog(log: WorkoutLog){
//    print("lol")
//}

#Preview {
    NewWorkoutView(workoutLog: .constant(mockData.SampleWorkout), Units: true)
}
