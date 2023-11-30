//
//  LogFormType.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 11/29/23.
//
import SwiftUI

enum LogFormType: Identifiable, View {
    case new
    case update(Log)
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }

    var body: some View {
        switch self {
        case .new:
            return LogFormView(viewModel: LogFormVM())
        case .update(let event):
            return LogFormView(viewModel: LogFormVM(event))
        }
    }
}
