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
                }
                .padding(.vertical)
            }
            .navigationBarTitle("Home")
            .navigationBarItems(trailing:
                NavigationLink(
                    destination: SetMaker(),
                    isActive: $isSetMakerActive
                ) {
                    Text("Add Workout")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        //.background(Color("Green"), in: Capsule())
                }
            )
            .background(
                NavigationLink(
                    destination: SetMaker(),
                    isActive: $isSetMakerActive
                ) {
                    EmptyView()
                }
                .hidden()
            )
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
