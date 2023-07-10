//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Filip Karcz on 06/07/2023.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack{
                List($scrums) {$scrum in
                    NavigationLink(destination: DetailView(scrum: $scrum)){
                        CardView(scrum: scrum)
                        
                    }.listRowBackground(scrum.theme.mainColor)
                }.navigationTitle("Daily Scrums")
                    .toolbar{
                        Button(action: {}){
                            Image(systemName: "plus")
                        }
                        .accessibilityLabel("New Scrum")
                    }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData))
    }
}
