//
//  CalendeerView.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 11/27/23.
//  Calander View based of tutorial: https://www.youtube.com/watch?v=d8KYAeBDQAQ&t=560s&ab_channel=StewartLynch
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
