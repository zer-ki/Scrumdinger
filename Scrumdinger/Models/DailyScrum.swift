//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Filip Karcz on 06/07/2023.
//

import Foundation

struct DailyScrum {
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [DailyScrum(title: "Design", attendees: ["Simon", "Filip", "Joanathan"], lengthInMinutes: 10, theme: .yellow),
     DailyScrum(title: "AppDev", attendees: ["Marek", "Jarek", "Sebastian"], lengthInMinutes: 5, theme: .orange),
     DailyScrum(title: "WebDev", attendees: ["Odin", "Thor", "Felix"], lengthInMinutes: 5, theme: .poppy)]
}
