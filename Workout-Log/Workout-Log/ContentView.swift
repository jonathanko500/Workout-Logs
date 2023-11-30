//
//  ContentView.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 11/27/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var logStore: LogStore
    @State private var dateSelected: DateComponents?
    @State private var displayLog = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                CalenderView(interval: DateInterval(start: .distantPast, end: .distantFuture), logStore: logStore, dateSelected: $dateSelected, displayLog: $displayLog)
            }
            .navigationTitle("Workout Logs")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let logStore = LogStore(preview: true)
        return ContentView().environmentObject(logStore)
    }
}
