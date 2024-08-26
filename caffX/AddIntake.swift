//
//  AddIntake.swift
//  caffX
//
//  Created by Avyan Mehra on 20/8/24.
//

import SwiftUI



struct AddIntake: View {
    @Binding var intakeGraph: [Int]
    @Binding var date: Date
    @State var selectedDate = Date()
    @State var customDrink: String
    @State var selectedDrink: drink
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        List {
            Section {
                DatePicker("Date", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                
                
                Picker("Drink", selection: $selectedDrink) {
                    
                    ForEach(drinkList, id: \.self) { item in
                        Text(item.name)
                            .font(.headline)
                            .padding()
                    }
                }
                
                if selectedDrink.name != "Custom" {
                    HStack {
                        Text("Caffeine")
                        Spacer()
                        Text(String(selectedDrink.caff))
                            .foregroundStyle(.gray)
                    }
                }
            }
            
            if selectedDrink.name == "Custom" {
                Section {
                    TextField("Drink Name", text: $customDrink)
                    HStack {
                        Text("Caffeine")
                        Spacer()
                        Picker(selection: $selectedDrink.caff, label:Text("Numbers")) {
                            ForEach(0...999 ,id:\.self) { number in
                                Text(String(number))
                            }
                            
                        }.pickerStyle(.wheel)
                    }
                }
                
            }
            Section {
                Button {
                    dismiss.callAsFunction()
                    intakeGraph.append(Int(selectedDrink.caff))
                    date = selectedDate
                } label: {
                    HStack {
                        Spacer()
                        Text("Add Intake")
                            .foregroundStyle(.green)
                            .bold()
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    AddIntake(intakeGraph: .constant([0]), date: .constant(.now), customDrink:  "Drink Name", selectedDrink: drink(name: "", caff: 0))
}
