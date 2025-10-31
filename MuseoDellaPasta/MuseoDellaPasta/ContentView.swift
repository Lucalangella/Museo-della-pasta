//
//  ContentView.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 27/10/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State var selectedPasta: PastaType? = nil
    @State var showHistoricalTimeline = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image
                Image("tomatoes")
                    .resizable()
                    .scaledToFill()
                
            
                    VStack(spacing: 30) {
                        // Welcome Section
                        WelcomeHeader()
                        
                        // Quick Access Cards
                        HStack(spacing: 15) {
                            NavigationLink {
                                PastaGalleryView()
                            } label: {
                                FeatureCard(
                                    icon: "🥟",
                                    title: "Explore Pasta",
                                    description: "Discover 6 traditional pasta types"
                                )
                            }
                            .buttonStyle(.plain)
                            
                            NavigationLink {
                                HistoricalTimelineView()
                            } label: {
                                FeatureCard(
                                    icon: "📜",
                                    title: "History",
                                    description: "Journey through pasta's evolution"
                                )
                            }
                            .buttonStyle(.plain)
                            
                            NavigationLink {
                                CultureView()
                            } label: {
                                FeatureCard(
                                    icon: "🇮🇹",
                                    title: "Culture",
                                    description: "Pasta as Italian heritage"
                                )
                            }
                            .buttonStyle(.plain)
                            
                            NavigationLink {
                                SustainabilityView()
                            } label: {
                                FeatureCard(
                                    icon: "🌱",
                                    title: "Sustainability",
                                    description: "Innovation & ESG framework"
                                )
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(.horizontal)
                        
                        // Featured Pasta Model
                        InteractivePastaPreview()
                        
//                        // Innovation Section
//                        InnovationShowcase()
                        
//                        Spacer(minLength: 40)
                    }
                    .padding()
                
            }
        }
    }
}

struct WelcomeHeader: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("🍝")
                .font(.system(size: 80))
            
            Text("Museo della Pasta Italiana")
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
            
            Text("Un viaggio nella tradizione, cultura e innovazione")
                .font(.system(size: 18))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            
            Divider()
                .padding(.vertical, 10)
        }
        .padding(.top, 20)
    }
}

struct FeatureCard: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 15) {
            Text(icon)
                .font(.system(size: 50))
            
            Text(title)
                .font(.system(size: 20, weight: .semibold))
            
            Text(description)
                .font(.system(size: 14))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(25)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThickMaterial)
        }
        .hoverEffect()
    }
}

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
                    openWindow(id: "pastaVolume")
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

struct PastaVolumeView: View {
    let modelName: String
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.openWindow) private var openWindow
    @State var rotation: Angle = .zero
    @State var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            RealityView { content in
                // Load Farfalle as preview from main bundle (.usdz under "3D models/")
                if let entity = try? await Entity(named: modelName, in: .main) {
                    // Auto-fit the model to a target size and center it
                    let bounds = entity.visualBounds(relativeTo: nil)
                    let maxDimension = max(bounds.extents.x, bounds.extents.y, bounds.extents.z)
                    let target: Float = 0.3 // meters of max dimension in the volume
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
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let rotationAmount = Angle(degrees: Double(value.translation.width) * 0.5)
                        rotation = rotationAmount
                    }
            )
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
//                Button {
//                    openWindow(id: "main")
//                } label: {
//                    Label("Show App", systemImage: "rectangle.on.rectangle")
//                }

                Button {
                    withAnimation {
                        rotation.degrees -= 45
                    }
                } label: {
                    Label("Rotate", systemImage: "arrow.counterclockwise")
                }
                
//                Button {
//                    withAnimation {
//                        scale = scale == 1.0 ? 1.5 : 1.0
//                    }
//                } label: {
//                    Label(scale == 1.0 ? "Enlarge" : "Reduce", systemImage: scale == 1.0 ? "plus.magnifyingglass" : "minus.magnifyingglass")
//                }

                Button {
                    dismissWindow(id: "pastaVolume")
                } label: {
                    Label("Close", systemImage: "xmark.circle")
                }
            }
        }
    }
}
//
//struct InnovationShowcase: View {
//    var body: some View {
//        VStack(alignment: .leading, spacing: 15) {
//            Text("Innovazione e Sostenibilità")
//                .font(.title2)
//                .bold()
//            
//            VStack(spacing: 15) {
//                InnovationItem(
//                    icon: "🎨",
//                    title: "Design Innovativo",
//                    description: "Esperienze immersive con tecnologie AR/VR"
//                )
//                
//                InnovationItem(
//                    icon: "🌱",
//                    title: "Sostenibilità",
//                    description: "Progetto allineato ai principi ESG"
//                )
//                
//                InnovationItem(
//                    icon: "🎓",
//                    title: "Cultura ed Educazione",
//                    description: "Valorizzazione del patrimonio italiano"
//                )
//            }
//        }
//        .padding()
//        .frame(maxWidth: 600)
//    }
//}

struct InnovationItem: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 15) {
            Text(icon)
                .font(.system(size: 40))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.ultraThinMaterial)
        }
    }
}

// MARK: - Pasta Type Model

enum PastaType: String, CaseIterable, Identifiable {
    case agnolotti = "Agnolotti"
    case farfalle = "Farfalle"
    case fusillo = "Fusillo"
    case rigatoni = "Rigatoni"
    case tagliatelle = "Tagliatelle"
    case tortello = "Tortello"
    
    var id: String { rawValue }
    
    var modelName: String {
        switch self {
        case .agnolotti: return "agnolotti"
        case .farfalle: return "farfalle"
        case .fusillo: return "fusillo5"
        case .rigatoni: return "rigatoni"
        case .tagliatelle: return "tagliatelle"
        case .tortello: return "Tortellazzo"
        }
    }
    
    var description: String {
        switch self {
        case .agnolotti:
            return "Pasta ripiena tradizionale del Piemonte"
        case .farfalle:
            return "Pasta a forma di farfalla del Nord Italia"
        case .fusillo:
            return "Pasta corta a forma elicoidale"
        case .rigatoni:
            return "Pasta corta larga con rigature"
        case .tagliatelle:
            return "Pasta lunga piatta dell'Emilia-Romagna"
        case .tortello:
            return "Pasta ripiena tradizionale del Nord Italia"
        }
    }
    
    var history: String {
        switch self {
        case .agnolotti:
            return "Gli agnolotti nascono nel Piemonte medievale e rappresentano una delle paste ripiene più antiche d'Italia."
        case .farfalle:
            return "Le farfalle sono state inventate in Lombardia nel XVI secolo, ispirandosi alla forma delle ali delle farfalle."
        case .fusillo:
            return "Originaria del Sud Italia, il fusillo è una pasta con la forma dell'elica, ideale per trattenere i sughi."
        case .rigatoni:
            return "I rigatoni, con le loro caratteristiche rigature, sono nati nel Lazio e sono perfetti per i sughi corposi."
        case .tagliatelle:
            return "Le tagliatelle sono patrimonio dell'Emilia-Romagna e rappresentano l'essenza della cucina bolognese."
        case .tortello:
            return "Il tortello, variante del tortellino, è simbolo della gastronomia emiliana di antica tradizione."
        }
    }
}

#Preview {
    ContentView()
}

//#Preview(windowStyle: .volumetric) {
//    PastaVolumeView(modelName: "farfalle")
//}

