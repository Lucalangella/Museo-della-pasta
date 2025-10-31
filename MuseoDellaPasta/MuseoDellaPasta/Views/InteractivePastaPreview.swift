//
//  InteractivePastaPreview.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 31/10/25.
//

import SwiftUI

struct InteractivePastaPreview: View {
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Featured Pasta")
                .font(.system(size: 24, weight: .bold))
            
            VStack(spacing: 20) {
                Image(systemName: "cube.transparent")
                    .font(.system(size: 80))
                    .foregroundStyle(.orange)
                
                VStack(spacing: 10) {
                    Text("Farfalle")
                        .font(.title3)
                        .bold()
                    
                    Text("The butterfly-shaped pasta from Northern Italy")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding()
                .frame(maxWidth: 400)
                
                Button {
                    openWindow(id: "pastaVolume", value: "farfalle")
                } label: {
                    Label("View in 3D", systemImage: "cube.box")
                        .font(.headline)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 15)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.regularMaterial)
        }
        .frame(maxWidth: 600)
    }
}

#Preview {
    InteractivePastaPreview()
}
