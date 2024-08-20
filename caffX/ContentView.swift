//
//  ContentView.swift
//  caffX
//
//  Created by Avyan Mehra on 19/8/24.
//

import SwiftUI
import Charts


struct ContentView: View {
    @State var caffIntake = [20,18,16,116,100,89,78,64,29,47]
    @State var addIntake = false
    var body: some View {
        NavigationStack {
            Text("Today's Intake")
                .font(.largeTitle)
                .fontWeight(.medium)
            Chart {
                ForEach(0..<caffIntake.count, id: \.self) { entry in
                    LineMark(
                        x: .value("Hour",entry+1),
                        y: .value("Ca",caffIntake[entry])
                    )
                
                }
            }
           
           
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
            
                .navigationTitle("caffX")
                .navigationBarTitleDisplayMode(.large)
                .sheet(isPresented: $addIntake) {
                    AddIntake(intakeGraph: $caffIntake, customDrink: "")
                }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
