//
//  AddIntake.swift
//  caffX
//
//  Created by Avyan Mehra on 20/8/24.
//

import SwiftUI



struct AddIntake: View {
    @Binding var intakeGraph: [Int]
    @State var selectedDate = Date()
    @State var customDrink: String
    @State private var selectedDrink = drink(name: "placeholder", caff: 0)
    var body: some View {
        Form {
            Section {
                DatePicker("Date", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                
                
                Picker("Drink", selection: $selectedDrink) {
                    
                    ForEach(drinkList) {item in
                        Text(item.name + String(item.caff))
                            .font(.headline)
                            .padding()
                    }
                    
                    
                }
            }
            
            if selectedDrink.name == "Custom" {
                Section {
                    TextField(text: $customDrink) {
                        Text("Drink Name")
                    }
                }
            }
                
            
        }
    }
}
#Preview {
    AddIntake(intakeGraph: .constant([0]), customDrink:  "Drink Name")
}
