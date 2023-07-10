//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Filip Karcz on 07/07/2023.
//

import SwiftUI

@available(iOS 16.0, *)
struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    
    var body: some View {
        List{
            Section(header: Text("Meeting info")){
                NavigationLink(destination: MeetingView()){
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }.accessibilityElement(children: .combine)
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }.accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees){ attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }.navigationTitle(scrum.title)
            .toolbar {
                Button("Edit"){
                    isPresentingEditView = true
                    editingScrum = scrum
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationStack{
                    DetailedEditView(scrum: $editingScrum)
                        .navigationTitle(scrum.title)
                        .toolbar{
                            ToolbarItem(placement: .cancellationAction){
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction){
                                Button("Done"){
                                    isPresentingEditView = false
                                    scrum = editingScrum
                                }
                            }
                        }
                }
            }
    }
}

@available(iOS 16.0, *)
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            DetailView(scrum: .constant(DailyScrum.sampleData[0]))
        }
    }
}
