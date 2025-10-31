//
//  PastaCard.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 31/10/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct PastaCard: View {
    let pasta: PastaType
    @State private var rotation: Angle = .zero
    
    var body: some View {
        VStack {
            // MARK: - Model3D Implementation
            Model3D(named: pasta.modelName, bundle: .main) { model in
                // Success: When the model loads successfully
                model
                    // Scale and positioning adjustments
                    .resizable() // Allows the model to be resized by the frame
                    .aspectRatio(contentMode: .fit) // Fits the model within the frame
                    // Apply rotation using the .rotation3DEffect modifier
                    .rotation3DEffect(
                        rotation,
                        axis: (x: 0.0, y: 1.0, z: 0.0) // Rotate around the Y-axis
                    )
                    // The RealityKit content might be large; you may need to apply a universal scale.
                    // The frame size below will help constrain it.
            } placeholder: {
                // Placeholder view while the model is loading
                ProgressView()
            }
            .frame(height: 180) // Set the display frame height
            .cornerRadius(15)
            .onAppear {
                // Start the rotation animation
                withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                    rotation = .degrees(360)
                }
            }
            
            // ---
            
            VStack(spacing: 5) {
                Text(pasta.rawValue)
                    .font(.title3)
                    .bold()
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.regularMaterial)
        }
        .hoverEffect()
    }
}

#Preview {
    PastaCard(pasta: .orecchietta)
}
