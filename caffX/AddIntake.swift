//
//  AddIntake.swift
//  caffX
//
//  Created by Avyan Mehra on 20/8/24.
//

import SwiftUI

func hour24(from date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter.string(from: date)
}


struct AddIntake: View {
    @Binding var intakeGraph: [Int]
    @Binding var date: Date
    @Binding var firstint: Bool
    @State var selectedDate = Date()
    @State var customDrink: String
    @State var selectedDrink: drink
    @State var wrongDate = false
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
                    if date > .now {
                        wrongDate = true
                    } else {
                        dismiss.callAsFunction()
                        print(hour24(from: selectedDate))
                        
                        let temparr = hour24(from: selectedDate).components(separatedBy: ":")
                        print(temparr[0])
                        print(temparr[1])
                        firstint = true
                        intakeGraph.insert(Int(selectedDrink.caff), at: Int(temparr[0])!)
                        date = selectedDate
                    }
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
        .alert("Date should be in the past", isPresented: $wrongDate) {
            Button("Ok", role: .cancel) {}
        }
    }
}

#Preview {
    AddIntake(intakeGraph: .constant([0]), date: .constant(.now), firstint: .constant(false), customDrink:  "Drink Name", selectedDrink: drink(name: "", caff: 64))
}
