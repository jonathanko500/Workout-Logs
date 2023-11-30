//
//  LogStore.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 11/28/23.
//

import Foundation

@MainActor
class LogStore: ObservableObject {
    @Published var events = [Log]()
    @Published var preview: Bool
    @Published var changedEvent: Log?
    @Published var movedEvent: Log?

    init(preview: Bool = false) {
        self.preview = preview
        fetchEvents()
    }

    func fetchEvents() {
        if preview {
            events = Log.sampleEvents
        } else {
            // load from your persistence store
        }
    }

    func delete(_ event: Log) {
        if let index = events.firstIndex(where: {$0.id == event.id}) {
            changedEvent = events.remove(at: index)
        }
    }

    func add(_ event: Log) {
        events.append(event)
        changedEvent = event
    }

    func update(_ event: Log) {
        if let index = events.firstIndex(where: {$0.id == event.id}) {
            movedEvent = events[index]
            events[index].date = event.date
            events[index].note = event.note
            events[index].logType = event.logType
            changedEvent = event
        }
    }

}
