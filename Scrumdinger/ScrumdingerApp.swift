//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Filip Karcz on 06/07/2023.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
