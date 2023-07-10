//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Filip Karcz on 10/07/2023.
//

import SwiftUI

@available(iOS 16.0, *)
struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection){
            ForEach(Theme.allCases){ theme in
                ThemeView(theme: theme)
                    .tag(theme)
                
            }
        }.pickerStyle(.navigationLink)
    }
}

@available(iOS 16.0, *)
struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
