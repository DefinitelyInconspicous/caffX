//
//  ContentView.swift
//  caffX
//
//  Created by Avyan Mehra on 19/8/24.
//

import SwiftUI
import Charts


struct ContentView: View {
    @State var caffIntake = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @State var dates = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
    @State var addIntake = false
    @State var date: Date
    @State var firstInt = false
    @State var calcCaff = [0]
    @State var currCaff = 0.0
    
    var body: some View {
        NavigationStack {
            Text("Today's Intake")
                .font(.largeTitle)
                .fontWeight(.medium)
            Chart {
                ForEach(0..<caffIntake.count, id: \.self) { entry in
                    LineMark(
                        x: .value("Hour", date ),
                        y: .value("Ca",caffIntake[entry])
                    )
                    
                }
            }
            .padding()
            .background(.cyan)
                .cornerRadius(10)
                .opacity(0.65)
            .frame(width: 300, height: 200)
            .padding()
            Button {
                addIntake = true
            } label: {
                HStack {
                    Spacer()
                    Text("Add Intake")
                        .font(.headline)
                    Spacer()
                }
            }
            .buttonStyle(BorderedButtonStyle())
            .padding()
            
            Button {
                
            } label: {
                Spacer()
                Text("Set Goal")
                    .font(.headline)
                Spacer()
            }
            .buttonStyle(BorderedButtonStyle())
            .padding()
            
            .navigationTitle("caffX")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $addIntake) {
                
                AddIntake(intakeGraph: $caffIntake, date: $date, firstint: $firstInt, customDrink: "", selectedDrink: drink(name: "", caff: 0))
                
            }.presentationDetents([.medium])
            
            Spacer()
        }
        .onAppear() {
            if firstInt == true {
                for i in caffIntake {
                    if i != 0 {
                        let firstVal = i
                        let firstIndex = caffIntake.firstIndex(of: i)
                        currCaff = floor( Double(firstVal) / 5.5)
                        for k in 0...(caffIntake.count-(firstIndex ?? 0)) {
                            
                            calcCaff.insert(Int(currCaff), at: k)
                            currCaff -= Double(firstVal) / 5.5
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(dates: [0], date: .now)
}
