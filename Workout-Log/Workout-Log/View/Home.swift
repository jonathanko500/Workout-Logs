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
            
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
