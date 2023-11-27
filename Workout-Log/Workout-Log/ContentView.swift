//
//  ContentView.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 11/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                CalenderView(interval: DateInterval(start: .distantPast, end: .distantFuture))
            }
                .navigationTitle("Workout Logs")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
