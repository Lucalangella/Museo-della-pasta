//
//  UtensilGalleryView.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 31/10/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct UtensilGalleryView: View {
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Gli Utensili")
                .font(.system(size: 54, weight: .bold))
                .padding(.top, 20)
            
            Text("Scopri gli strumenti tradizionali per la pasta")
                .font(.system(size: 32))
                .foregroundStyle(.secondary)
            ScrollView {
                let columns = [
                    GridItem(.adaptive(minimum: 280), spacing: 16)
                ]
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(UtensilType.allCases) { utensil in
                        UtensilCard(utensil: utensil)
                            .frame(height: 260)
                            .onTapGesture {
                                openWindow(id: "utensilVolume", value: utensil.modelName)
                            }
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    UtensilGalleryView()
}


