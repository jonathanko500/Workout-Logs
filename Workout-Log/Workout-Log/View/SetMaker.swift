//
//  SetMaker.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 12/2/23.
//

import SwiftUI

struct SetMaker: View {
    @State private var warmUpSets: String = ""
    @State private var warmUpNotes: String = ""
    
    @State private var preSets: String = ""
    @State private var preNotes: String = ""
    
    @State private var mainSets: String = ""
    @State private var mainNotes: String = ""
    
    @State private var warmDownSets: String = ""
    @State private var warmDownNotes: String = ""
    
    @State private var selectedDate = Date() // Selected date
    
    var body: some View {
        Form {
            Section(header: Text("Date")) {
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.compact)
            }
            
            createSection(withHeader: "Warm Up", textEditor: $warmUpSets, textField: $warmUpNotes)
            createSection(withHeader: "Pre Set", textEditor: $preSets, textField: $preNotes)
            createSection(withHeader: "Main Set", textEditor: $mainSets, textField: $mainNotes)
            createSection(withHeader: "Warm Down", textEditor: $warmDownSets, textField: $warmDownNotes)
            
            Button("Save Work Out") {
                let newWarmUp = Set.WarmUp(set: Set(sets: warmUpSets, notes: warmUpNotes))
                // Save newWarmUp to Core Data
                
                let newPreSet = Set.PreSet(set: Set(sets: preSets, notes: preNotes))
                // Save newPreSet to Core Data
                
                let newMainSet = Set.MainSet(set: Set(sets: mainSets, notes: mainNotes))
                // Save newMainSet to Core Data
                
                let newWarmDown = Set.WarmDown(set: Set(sets: warmDownSets, notes: warmDownNotes))
                // Save newWarmDown to Core Data
                
                let newDate = selectedDate
                
                saveToSets(warmUp: newWarmUp, preSet: newPreSet, mainSet: newMainSet, warmDown: newWarmDown, date: newDate)
                
                
                
                
            }
        }
        
    }
}

// Function to create a consistent layout for TextEditor and TextField
func createSection(withHeader header: String, textEditor: Binding<String>, textField: Binding<String>) -> some View {
    Section(header: Text(header)) {
        VStack {
            TextEditor(text: textEditor)
                .frame(minHeight: 100)
                .border(Color.gray, width: 1)
                .padding(.top, 10)
            TextField("Focus", text: textField)
        }
    }
}



struct SetMaker_Previews: PreviewProvider {
    static var previews: some View {
        SetMaker()
    }
}
