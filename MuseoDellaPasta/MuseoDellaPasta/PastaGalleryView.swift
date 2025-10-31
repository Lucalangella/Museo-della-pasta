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
                    .font(.system(size: 36, weight: .bold))
                    .padding(.top, 20)
                
                Text("Scopri le paste tradizionali italiane")
                    .font(.title3)
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

struct PastaCard: View {
    let pasta: PastaType
    @State private var rotation: Angle = .zero
    
    var body: some View {
        VStack(spacing: 15) {
            RealityView { content in
                if let entity = try? await Entity(named: pasta.modelName, in: .main) {
                    let bounds = entity.visualBounds(relativeTo: nil)
                    let maxDimension = max(bounds.extents.x, bounds.extents.y, bounds.extents.z)
                    let target: Float = 0.14
                    let factor = maxDimension > 0 ? target / maxDimension : 1
                    entity.scale = [factor, factor, factor]
                    entity.position = [0, -(bounds.center.y * factor), 0]
                    content.add(entity)
                }
            } update: { content in
                if let entity = content.entities.first {
                    entity.orientation = simd_quatf(angle: Float(rotation.radians), axis: [0, 1, 0])
                }
            }
            .frame(height: 180)
            .cornerRadius(15)
            .onAppear {
                withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                    rotation = .degrees(360)
                }
            }
            
            VStack(spacing: 5) {
                Text(pasta.rawValue)
                    .font(.title3)
                    .bold()
                
                Text(pasta.description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.regularMaterial)
        }
        .hoverEffect()
    }
}

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


