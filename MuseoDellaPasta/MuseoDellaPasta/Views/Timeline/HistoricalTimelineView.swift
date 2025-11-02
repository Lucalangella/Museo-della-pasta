//
//  HistoricalTimelineView.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 27/10/25.
//

import SwiftUI

struct HistoricalTimelineView: View {
    
    @State var selectedEvent: HistoricalEvent? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("📜 Storia della Pasta")
                    .font(.system(size: 36, weight: .bold))
                    .padding(.top, 20)
                
                Text("Un viaggio attraverso i millenni")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                
                TimelineView(events: historicalEvents)
                    .padding()
            }
            .padding()
        }
    }
}




