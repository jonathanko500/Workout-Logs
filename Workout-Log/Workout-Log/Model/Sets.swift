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


