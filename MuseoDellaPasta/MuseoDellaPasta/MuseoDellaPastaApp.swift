//
//  MuseoDellaPastaApp.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 27/10/25.
//

import SwiftUI

@main
struct MuseoDellaPastaApp: App {
    var body: some Scene {
        WindowGroup(id: "main") {
            ContentView()
        }
        .windowStyle(.automatic)

        // Window for 3D pasta volume preview, opened with a String model name
        WindowGroup(id: "pastaVolume", for: String.self) { $modelName in
            if let modelName {
                PastaVolumeView(modelName: modelName)
            } else {
                // Fallback model if no value is provided
                PastaVolumeView(modelName: "farfalle")
            }
        }
        .windowStyle(.volumetric)
    }
}
