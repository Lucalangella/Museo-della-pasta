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
    @State private var angle: Angle = .degrees(0)
    
    var body: some View {
        VStack {
                  Model3D(named: pasta.modelName) { model in
                      switch model {
                      case .empty:
                          ProgressView()
                          
                      case .success(let resolvedModel3D):
                          resolvedModel3D
                              .resizable() // Allows the model to be resized by the frame
                                                 .aspectRatio(contentMode: .fit) // Fits the model within the frame
                              .scaleEffect(0.4)
                              .rotation3DEffect(angle, axis: .x)
                              .rotation3DEffect(angle, axis: .y)
                              .animation(.linear(duration: 10).repeatForever(autoreverses: false), value: angle)
                              .onAppear {
                                  angle = .degrees(360)
                              }
                              
                      case .failure(let error):
                          Text(error.localizedDescription)
                          
                      @unknown default:
                          EmptyView()
                      }
                  }
                  .frame(width: 200, height: 200)
                       .padding(16)
                       .background {
                           RoundedRectangle(cornerRadius: 20)
                               .fill(.regularMaterial)
                       }
              
            
            
            
//            // MARK: - Mensola Model3D Implementation (Shelf/Base)
//            Model3D(named: "mensola", bundle: .main) { model in
//                model
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    // We don't apply rotation here as it should be a static base
//            } placeholder: {
//                // Placeholder for the shelf model
//                ProgressView()
//            }
//            .frame(height: 50) // Set a smaller height for the shelf/base
//            .padding(.top, -30) // Pull the shelf up closer to the pasta model
//
//            // ---
            
            VStack(spacing: 5) {
                Text(pasta.rawValue)
                    .font(.title)
            }
        }
        
    }
}

#Preview {
    PastaCard(pasta: .orecchietta)
}
