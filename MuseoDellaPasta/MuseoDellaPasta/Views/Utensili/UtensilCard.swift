//
//  UtensilCard.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 31/10/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct UtensilCard: View {
    let utensil: UtensilType
    @State private var angle: Angle = .degrees(0)
    
    var body: some View {
        VStack {
            Model3D(named: utensil.modelName) { model in
                switch model {
                case .empty:
                    ProgressView()
                    
                case .success(let resolvedModel3D):
                    resolvedModel3D
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(0.8)
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
            
            VStack(spacing: 5) {
                Text(utensil.rawValue)
                    .font(.title)
            }
        }
    }
}

#Preview {
    UtensilCard(utensil: .chitarra)
}


