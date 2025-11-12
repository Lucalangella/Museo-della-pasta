//
//  MainGalleryView.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 31/10/25.
//

import SwiftUI

enum GallerySection: String, CaseIterable {
    case pasta = "Pasta"
    case utensili = "Utensili"
    
    var id: String { rawValue }
}

struct MainGalleryView: View {
    @State private var selectedSection: GallerySection = .pasta
    
    var body: some View {
        VStack(spacing: 0) {
            // Header with navigation tabs
            HStack(spacing: 40) {
                ForEach(GallerySection.allCases, id: \.self) { section in
                    Button(action: {
                        withAnimation {
                            selectedSection = section
                        }
                    }) {
                        VStack(spacing: 8) {
                            Text(section.rawValue)
                                .font(.system(size: 36, weight: .bold))
                                .foregroundColor(selectedSection == section ? .primary : .secondary)
                            
                            if selectedSection == section {
                                Rectangle()
                                    .fill(.primary)
                                    .frame(height: 3)
                                    .animation(.spring(), value: selectedSection)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 30)
            
            // Content based on selected section
            Group {
                switch selectedSection {
                case .pasta:
                    PastaGalleryView()
                case .utensili:
                    UtensilGalleryView()
                }
            }
            .transition(.opacity)
        }
    }
}

#Preview {
    MainGalleryView()
}


