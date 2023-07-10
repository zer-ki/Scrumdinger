//
//  DetailedEditView.swift
//  Scrumdinger
//
//  Created by Filip Karcz on 08/07/2023.
//

import SwiftUI

@available(iOS 16.0, *)
struct DetailedEditView: View {
    @Binding var scrum: DailyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form{
            Section(header: Text("Meeting info")) {
                TextField("Title", text: $scrum.title)
                HStack{
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1){
                        Text("Lenght")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) miutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees){ attendee in
                    Text(attendee.name)
                }
                .onDelete{ indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack{
                    TextField("New Attendee", text:$newAttendeeName)
                    Button(action: {
                        withAnimation{
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                            }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }.disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

@available(iOS 16.0, *)
struct DetailedEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedEditView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}







