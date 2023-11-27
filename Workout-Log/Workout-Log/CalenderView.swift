//
//  CalendeerView.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 11/27/23.
//

import SwiftUI

struct CalenderView: UIViewRepresentable{
    let interval: DateInterval
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
    
    
    
}
