//
//  UtensilVolumeView.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 31/10/25.
//

import SwiftUI
import RealityKit

struct UtensilVolumeView: View {
    let modelName: String
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.openWindow) private var openWindow
    @State var rotation: Angle = .zero
    @State var scale: CGFloat = 1.0
    
    private var utensilType: UtensilType? {
        UtensilType.allCases.first { $0.modelName == modelName }
    }
    
    var body: some View {
        VStack {
            Model3D(named: modelName, bundle: .main) { model in
                model
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .manipulable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 350, height: 350)
            .padding(.leading, 120)
        }
        .scenePadding(.trailing)
        .padding(.trailing, 520)
        .ornament(attachmentAnchor: .scene(.trailing)) {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    if let utensilType {
                        Text(utensilType.rawValue)
                            .font(.system(size: 42))
                            .bold()
                        Text(utensilType.description)
                            .font(.system(size: 32))
                            .foregroundStyle(.secondary)
                        Divider()
                        Text("Storia")
                            .font(.system(size: 36))
                            .bold()
                        Text(utensilType.history)
                            .font(.system(size: 28))
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    } else {
                        Text(modelName.capitalized)
                            .font(.title)
                            .bold()
                        Text("Descrizione non disponibile")
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(16)
            }
            .frame(maxWidth: 480, maxHeight: 600, alignment: .leading)
            .glassBackgroundEffect()
        }
    }
}

#Preview {
    UtensilVolumeView(modelName: "chitarra")
}

