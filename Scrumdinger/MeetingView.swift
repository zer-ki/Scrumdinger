//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Filip Karcz on 06/07/2023.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 10, total: 15)
            HStack{
                VStack {
                    Text("Seconds elapsed")
                }
                VStack {
                    Text("Seconds reamaining")
                }

            }
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
