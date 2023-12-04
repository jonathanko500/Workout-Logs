//
//  ContentView.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 11/30/23.
//

import SwiftUI

struct Home: View {
    @State var currDate: Date = Date()
    @State var isSetMakerActive = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // Date Picker
                    CustomDatePicker(currDate: $currDate)
                    
                    Button("Add Workout") {
                        isSetMakerActive = true
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .sheet(isPresented: $isSetMakerActive) {
                        SetMaker()
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .navigationBarTitle("Home")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
