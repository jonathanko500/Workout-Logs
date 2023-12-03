//
//  Log.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 12/2/23.
//

import SwiftUI

// Base Set struct
struct Set: Identifiable {
    var id = UUID().uuidString
    var sets: String
    var notes: String
}

// Extended structs
extension Set {
    struct WarmUp {
        var set: Set
        
    }
    
    struct PreSet {
        var set: Set
        
    }
    
    struct MainSet {
        var set: Set
        
    }
    
    struct WarmDown {
        var set: Set
        
    }
}


struct SetMetaData: Identifiable {
    var id = UUID().uuidString
    var set: [Set] // Fix the array declaration
    var setDate: Date
}


var sets: [SetMetaData] = []

func saveToSets(warmUp: Set.WarmUp, preSet: Set.PreSet, mainSet: Set.MainSet, warmDown: Set.WarmDown, date: Date) {
    // Create Set objects from the provided input
    let warmUpSet = Set(sets: warmUp.set.sets, notes: warmUp.set.notes)
    let preSetSet = Set(sets: preSet.set.sets, notes: preSet.set.notes)
    let mainSetSet = Set(sets: mainSet.set.sets, notes: mainSet.set.notes)
    let warmDownSet = Set(sets: warmDown.set.sets, notes: warmDown.set.notes)
    
    print("Warm Up Sets: \(warmUpSet.sets), Warm Up Notes: \(warmUpSet.notes)")
    print("Pre Sets: \(preSetSet.sets), Pre Notes: \(preSetSet.notes)")
    print("Main Sets: \(mainSetSet.sets), Main Notes: \(mainSetSet.notes)")
    print("Warm Down Sets: \(warmDownSet.sets), Warm Down Notes: \(warmDownSet.notes)")
    print("Date: \(date)")
    
    // Create SetMetaData object
    let setMetaData = SetMetaData(set: [warmUpSet, preSetSet, mainSetSet, warmDownSet], setDate: date)
    
    // Append SetMetaData to sets array
    sets.append(setMetaData)
}
