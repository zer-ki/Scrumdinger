//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Filip Karcz on 06/07/2023.
//

import Foundation

struct DailyScrum: Identifiable{
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double{
        get{
            Double(lengthInMinutes)
        }
        set{
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme){
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}
extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [DailyScrum(title: "Design", attendees: ["Simon", "Filip", "Joanathan"], lengthInMinutes: 10, theme: .yellow),
     DailyScrum(title: "AppDev", attendees: ["Marek", "Jarek", "Sebastian"], lengthInMinutes: 5, theme: .orange),
     DailyScrum(title: "WebDev", attendees: ["Odin", "Thor", "Felix"], lengthInMinutes: 5, theme: .poppy)]
}
