//
//  PastaGalleryView.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 27/10/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct PastaGalleryView: View {
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("La Collezione")
                    .font(.system(size: 54, weight: .bold))
                    .padding(.top, 20)
                
                Text("Scopri le paste tradizionali italiane")
                    .font(.system(size: 32))
                    .foregroundStyle(.secondary)
                
                let columns = [
                    GridItem(.adaptive(minimum: 280), spacing: 16)
                ]
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(PastaType.allCases) { pasta in
                        PastaCard(pasta: pasta)
                            .frame(height: 260)
                            .onTapGesture {
                                openWindow(id: "pastaVolume", value: pasta.modelName)
                            }
                    }
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    PastaGalleryView()
}



