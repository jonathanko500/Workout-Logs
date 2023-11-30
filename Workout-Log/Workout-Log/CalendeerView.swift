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
    @ObservedObject var logStore: LogStore
    @Binding var dateSelected: DateComponents?
    @Binding var displayLog: Bool
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.delegate = context.coordinator
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        let dateSelection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        view.selectionBehavior = dateSelection
        return view
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, logStore: _logStore)
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
    
    class Coordinator: NSObject, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
       
        
        
        var parent: CalenderView
        @ObservedObject var logStore:LogStore
        
        init(parent: CalenderView, logStore: ObservedObject<LogStore>) {
            self.parent = parent
            self._logStore = logStore
        }
        
        @MainActor
        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            
            let foundLog = logStore.events
                .filter{$0.date.startOfDay == dateComponents.date?.startOfDay}
            if foundLog.isEmpty {return nil}
            if foundLog.count > 1 {
                return .image(UIImage(systemName: "doc.on.doc.fill"),
                              color: .red,
                              size:.large)
            }
            let singleLog = foundLog.first!
            return .customView{
                let icon = UILabel()
                icon.text = singleLog.logType.icon
                return icon
            }
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate,
                                   didSelectDate dateComponents: DateComponents?) {
                    parent.dateSelected = dateComponents
                    guard let dateComponents else { return }
                    let foundEvents = logStore.events
                        .filter {$0.date.startOfDay == dateComponents.date?.startOfDay}
                    if !foundEvents.isEmpty {
                        parent.displayLog.toggle()
                    }
                }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
            return true
        }
    }
    
    
    
}
