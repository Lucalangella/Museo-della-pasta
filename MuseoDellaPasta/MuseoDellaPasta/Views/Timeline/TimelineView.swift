//
//  TimelineView.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 31/10/25.
//

import SwiftUI

struct TimelineView: View {
    let events: [HistoricalEvent]
    @State private var selectedIndex: Int? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(events.enumerated()), id: \.element.id) { index, event in
                TimelineItem(event: event, isExpanded: selectedIndex == index)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            selectedIndex = selectedIndex == index ? nil : index
                        }
                    }
                
                if index < events.count - 1 {
                    // Timeline connector
                    Rectangle()
                        .fill(.secondary.opacity(0.3))
                        .frame(width: 3)
                        .padding(.vertical, 5)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}
