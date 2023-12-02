//
//  ContentView.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 11/30/23.
//

import SwiftUI

struct Home: View {
    
    @State var currDate: Date = Date()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack (spacing: 20){
                
                //Date Picker
                CustomDatePicker(currDate: $currDate)
            }
            .padding(.vertical)
        }
        //safe area
        .safeAreaInset(edge: .bottom) {
            HStack{
                Button{
                    
                } label: {
                    Text("Add Workout")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Green"), in: Capsule())
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .foregroundColor(.blue)
            .background(.ultraThinMaterial)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
