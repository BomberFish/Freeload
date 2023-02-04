//
//  ContentView.swift
//  Freeload
//
//  Created by Hariz Shirazi on 2023-02-04.
//

import SwiftUI

struct ContentView: View {
    @State var inProgress = false
    let appVersion = ((Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown") + " (" + (Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown") + ")")
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: {
                        Haptic.shared.play(.heavy)
                        inProgress = true
                        let success = patch_installd()
                        if success {
                            UIApplication.shared.alert(title: "Success", body: "Successfully patched installd!", withButton: true)
                            Haptic.shared.notify(.success)
                        } else {
                            UIApplication.shared.alert(title: "Failure", body: "Failed to patch installd!", withButton: true)
                            Haptic.shared.notify(.error)
                        }
                    }, label: {
                        Label("Apply", systemImage: "checkmark.seal")
                    }
                    )
                }
                Section(header: Text("Freeload " + appVersion + "\nMade with ❤️ by BomberFish\nThanks @zhuowei for the installd patch")) {}.textCase(nil)
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
