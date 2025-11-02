//
//  TimelineItem.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 31/10/25.
//

import SwiftUI

struct TimelineItem: View {
    let event: HistoricalEvent
    let isExpanded: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            // Date Label
            VStack {
                Text(event.year)
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.white)
                    .frame(width: 100)
                    .padding(.vertical, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.orange)
                    }
                
                Circle()
                    .fill(Color.orange)
                    .frame(width: 20, height: 20)
                    .overlay {
                        Circle()
                            .fill(Color.orange.opacity(0.3))
                            .frame(width: 40, height: 40)
                    }
            }
            
            // Content
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(event.icon)
                        .font(.system(size: 30))
                    
                    Text(event.title)
                        .font(.title3)
                        .bold()
                }
                
                if isExpanded {
                    Text(event.description)
                        .font(.body)
                        .lineSpacing(5)
                        .transition(.opacity.combined(with: .move(edge: .top)))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(isExpanded ? .regularMaterial : .ultraThinMaterial)
            }
        }
    }
}
