//
//  SustainabilityView.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 27/10/25.
//

import SwiftUI

struct SustainabilityView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 15) {
                    Text("🌱 Sostenibilità e Innovazione")
                        .font(.system(size: 36, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Progettando il futuro con responsabilità")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 20)
                
                // ESG Framework
                VStack(alignment: .leading, spacing: 25) {
                    Text("Framework ESG")
                        .font(.title)
                        .bold()
                    
                    ESGItem(
                        letter: "E",
                        title: "Environmental",
                        subtitle: "Ambiente",
                        description: "Il Museo della Pasta promuoverà pratiche sostenibili attraverso tecnologie a basso impatto energetico, materiali riciclabili e processi produttivi responsabili. L'edificio stesso sarà progettato con criteri di bioedilizia e integrazione di energie rinnovabili.",
                        color: .green
                    )
                    
                    ESGItem(
                        letter: "S",
                        title: "Social",
                        subtitle: "Sociale",
                        description: "Il Museo sarà un polo inclusivo che coinvolgerà la comunità locale, promuoverà programmi educativi per le scuole, e supporterà la formazione di giovani chef e artigiani. L'accessibilità sarà garantita a tutti attraverso tecnologie assistive e design universale.",
                        color: .blue
                    )
                    
                    ESGItem(
                        letter: "G",
                        title: "Governance",
                        subtitle: "Governo",
                        description: "Transparenza, accountability e gestione etica saranno i pilastri del governo del Museo. Partnership strategiche con istituzioni culturali, aziende locali sostenibili e organizzazioni no-profit garantiranno una governance partecipativa e responsabile.",
                        color: .purple
                    )
                }
                .padding()
                .frame(maxWidth: 700)
                
                // Innovation Technologies
                VStack(alignment: .leading, spacing: 20) {
                    Text("Tecnologie Innovative")
                        .font(.title2)
                        .bold()
                    
                    HStack(spacing: 15) {
                        TechBadge(icon: "arkit", title: "AR/VR\nEsperienze")
                        TechBadge(icon: "cpu", title: "AI\nInterattiva")
                        TechBadge(icon: "app.connected.to.app.below.fill", title: "IoT\nSensoristica")
                    }
                    
                    Text("Il Museo integrerà tecnologie all'avanguardia per creare esperienze immersive uniche. I visitatori potranno interagire con modelli 3D delle paste, scoprire la storia attraverso tour virtuali, e partecipare a laboratori interattivi che combinano tradizione e innovazione digitale.")
                        .font(.body)
                        .lineSpacing(5)
                        .padding()
                        .frame(maxWidth: 700)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.ultraThinMaterial)
                        }
                }
                .padding()
                
                // Museum Vision
                VStack(alignment: .leading, spacing: 20) {
                    Text("Vision del Museo")
                        .font(.title2)
                        .bold()
                    
                    VisionCard(
                        title: "Laboratorio Culturale Dinamico",
                        description: "Non solo esposizione, ma un centro attivo di ricerca, educazione e innovazione che evolve costantemente con nuovi contenuti e programmi.",
                        icon: "flask.fill"
                    )
                    
                    VisionCard(
                        title: "Ponte tra Tradizione e Futuro",
                        description: "Celebrare il passato mantenendolo rilevante per le nuove generazioni attraverso un approccio contemporaneo e sperimentale.",
                        icon: "arrow.triangle.branch")
                    
                    VisionCard(
                        title: "Hub Internazionale",
                        description: "Diventare un punto di riferimento globale per studiosi, chef, studenti e appassionati della cultura gastronomica italiana.",
                        icon: "globe.europe.africa.fill"
                    )
                }
                .padding()
                .frame(maxWidth: 700)
                
                Spacer(minLength: 40)
            }
            .padding()
        }
    }
}

struct ESGItem: View {
    let letter: String
    let title: String
    let subtitle: String
    let description: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(spacing: 15) {
                // Letter Badge
                ZStack {
                    Circle()
                        .fill(color)
                        .frame(width: 60, height: 60)
                    
                    Text(letter)
                        .font(.system(size: 36, weight: .bold))
                        .foregroundStyle(.white)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.title3)
                        .bold()
                    
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            
            Text(description)
                .font(.body)
                .lineSpacing(5)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.regularMaterial)
                .shadow(color: color.opacity(0.2), radius: 10)
        }
    }
}

struct TechBadge: View {
    let icon: String
    let title: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundStyle(.orange)
            
            Text(title)
                .font(.caption)
                .bold()
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.ultraThinMaterial)
        }
        .hoverEffect()
    }
}

struct VisionCard: View {
    let title: String
    let description: String
    let icon: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundStyle(.orange)
                .frame(width: 40)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.headline)
                    .bold()
                
                Text(description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineSpacing(4)
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.ultraThinMaterial)
        }
    }
}


