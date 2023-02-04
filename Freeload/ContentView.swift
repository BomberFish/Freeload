//
//  ContentView.swift
//  Freeload
//
//  Created by Hariz Shirazi on 2023-02-04.
//

import SwiftUI

struct ContentView: View {
    let appVersion = ((Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown") + " (" + (Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown") + ")")
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: {
                        print("test")
                        Haptic.shared.play(.heavy)
                    }, label: {
                        Label("Apply", systemImage: "checkmark.seal")
                    }
                    )
                }
                Section(header: Text("Freeload " + appVersion + "\nMade with ❤️ by BomberFish")) {}.textCase(nil)
                    .navigationTitle("Freeload")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
