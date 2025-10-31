//
//  FeatureCard.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 31/10/25.
//

import SwiftUI

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
        .padding(25)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThickMaterial)
        }
        .hoverEffect()
    }
}

#Preview {
    FeatureCard(   icon: "🥟",
                   title: "Explore Pasta",
                   description: "Discover 6 traditional pasta types")
}
