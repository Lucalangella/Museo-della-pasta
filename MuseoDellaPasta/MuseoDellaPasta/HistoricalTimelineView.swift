//
//  HistoricalTimelineView.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 27/10/25.
//

import SwiftUI

struct HistoricalTimelineView: View {
    let historicalEvents: [HistoricalEvent] = [
        HistoricalEvent(
            year: "8000 BCE",
            title: "Origini nell'Antichità",
            description: "I primi chicchi di grano vengono coltivati nella Mezzaluna Fertile. Il frumento diventa la base dell'alimentazione mediterranea.",
            icon: "🌾"
        ),
        HistoricalEvent(
            year: "100 CE",
            title: "Roma e i Laganum",
            description: "I Romani sviluppano la tecnica di produrre strisce di pasta piatta chiamate 'laganum', antenate delle moderne lasagne.",
            icon: "🏛️"
        ),
        HistoricalEvent(
            year: "1100 CE",
            title: "Nascita della Pasta Secca",
            description: "In Sicilia e nelle regioni meridionali si perfeziona l'arte della pasta secca, essiccata al sole per la conservazione.",
            icon: "☀️"
        ),
        HistoricalEvent(
            year: "1300 CE",
            title: "La Rivoluzione del Mulino",
            description: "L'invenzione del mulino ad acqua consente la produzione di farina su larga scala, rendendo la pasta accessibile a tutti.",
            icon: "⚙️"
        ),
        HistoricalEvent(
            year: "1500 CE",
            title: "L'Età dell'Oro",
            description: "Nel Rinascimento italiano nascono centinaia di varianti regionali: ogni città sviluppa le proprie forme caratteristiche.",
            icon: "🎨"
        ),
        HistoricalEvent(
            year: "1800 CE",
            title: "Industrializzazione",
            description: "La Rivoluzione Industriale introduce macchine per la produzione meccanica di pasta, aumentando la disponibilità e riducendo i costi.",
            icon: "🏭"
        ),
        HistoricalEvent(
            year: "1950 CE",
            title: "Diffusione Globale",
            description: "L'emigrazione italiana porta la pasta in tutto il mondo, diventando simbolo dell'identità culturale italiana.",
            icon: "🌍"
        ),
        HistoricalEvent(
            year: "2025 CE",
            title: "Innovazione e Sostenibilità",
            description: "Il Museo della Pasta unisce tradizione e innovazione, promuovendo la sostenibilità e la valorizzazione del patrimonio culturale.",
            icon: "🚀"
        )
    ]
    
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

struct HistoricalEvent: Identifiable {
    let id = UUID()
    let year: String
    let title: String
    let description: String
    let icon: String
}



