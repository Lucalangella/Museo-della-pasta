//
//  PastaDetailView.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 31/10/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct PastaDetailView: View {
    let pasta: PastaType
    @Environment(\.dismiss) var dismiss
    @State private var rotation: Angle = .zero
    @State private var scale: CGFloat = 1.0
    @State private var showHistory = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    // Large 3D Model
                    RealityView { content in
                        if let entity = try? await Entity(named: pasta.modelName, in: .main) {
                            let bounds = entity.visualBounds(relativeTo: nil)
                            let maxDimension = max(bounds.extents.x, bounds.extents.y, bounds.extents.z)
                            let target: Float = 0.35
                            let factor = maxDimension > 0 ? target / maxDimension : 1
                            entity.scale = [factor, factor, factor]
                            entity.position = [0, -(bounds.center.y * factor), 0]
                            content.add(entity)
                        }
                    } update: { content in
                        if let entity = content.entities.first {
                            entity.orientation = simd_quatf(angle: Float(rotation.radians), axis: [0, 1, 0])
                            entity.scale = simd_float3(Float(scale), Float(scale), Float(scale))
                        }
                    }
                    .frame(height: 360)
                    .cornerRadius(20)
                    .padding()
                    
                    // Pasta Info
                    VStack(spacing: 20) {
                        Text(pasta.rawValue)
                            .font(.system(size: 32, weight: .bold))
                        
                        Text(pasta.description)
                            .font(.title3)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                        
                        Divider()
                            .padding(.vertical, 10)
                        
                        // History Section
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Storia e Tradizione")
                                .font(.headline)
                                .bold()
                            
                            Text(pasta.history)
                                .font(.body)
                                .lineSpacing(5)
                        }
                        .padding()
                        .frame(maxWidth: 600)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.ultraThinMaterial)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Interactive Controls
                    HStack(spacing: 20) {
                        Button {
                            withAnimation {
                                rotation.degrees -= 45
                            }
                        } label: {
                            Label("Ruota", systemImage: "arrow.counterclockwise")
                        }
                        .buttonStyle(.bordered)
                        
                        Button {
                            withAnimation {
                                scale = scale == 1.0 ? 1.5 : 1.0
                            }
                        } label: {
                            Label(scale == 1.0 ? "Ingrandisci" : "Riduci", systemImage: scale == 1.0 ? "plus.magnifyingglass" : "minus.magnifyingglass")
                        }
                        .buttonStyle(.bordered)
                        
                        Button {
                            withAnimation {
                                rotation = .zero
                                scale = 1.0
                            }
                        } label: {
                            Label("Reset", systemImage: "arrow.counterclockwise.circle")
                        }
                        .buttonStyle(.bordered)
                    }
                    
                    Spacer(minLength: 40)
                }
                .padding()
            }
            .navigationTitle(pasta.rawValue)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Chiudi") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    PastaDetailView(pasta: .farfalle)
}
