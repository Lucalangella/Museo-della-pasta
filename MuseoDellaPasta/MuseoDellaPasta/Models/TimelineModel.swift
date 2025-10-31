//
//  TimelineModel.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 31/10/25.
//

import Foundation

struct HistoricalEvent: Identifiable {
    let id = UUID()
    let year: String
    let title: String
    let description: String
    let icon: String
}

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
