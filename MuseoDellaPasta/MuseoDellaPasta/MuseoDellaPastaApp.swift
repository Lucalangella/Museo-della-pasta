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
        .windowStyle(.volumetric)
        .defaultSize(width: 2400, height: 1800)
        
        WindowGroup(id: "pastaVolume", for: String.self) { $modelName in
            PastaVolumeView(modelName: $modelName.wrappedValue ?? "farfalle")
        }
        .windowStyle(.volumetric)
    }
}
