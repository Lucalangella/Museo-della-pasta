//
//  CultureView.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 27/10/25.
//

import SwiftUI

struct CultureView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("🇮🇹 Pasta e Identità Italiana")
                    .font(.system(size: 36, weight: .bold))
                    .padding(.top, 20)
                
                // Hero Quote
                VStack(spacing: 15) {
                    Image(systemName: "quote.opening")
                        .font(.system(size: 40))
                        .foregroundStyle(.orange.opacity(0.6))
                    
                    Text("La pasta non è solo cibo, è cultura, storia e identità.")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .italic()
                    
                    Image(systemName: "quote.closing")
                        .font(.system(size: 40))
                        .foregroundStyle(.orange.opacity(0.6))
                }
                .padding(40)
                .frame(maxWidth: 700)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.regularMaterial)
                }
                
                // Cultural Aspects
                CulturalAspectCard(
                    icon: "👨‍👩‍👧‍👦",
                    title: "Tradizione Familiare",
                    description: "Il profumo della pasta che bolle è parte del DNA delle famiglie italiane. Ogni ricetta si tramanda di generazione in generazione, creando un legame indissolubile con le proprie radici.",
                    color: .blue
                )
                
                CulturalAspectCard(
                    icon: "🗺️",
                    title: "Diversità Regionale",
                    description: "Ogni regione italiana ha sviluppato le proprie paste caratteristiche, dal pappardelle toscani ai bucatini laziali, dai spaghetti alla chitarra abruzzesi alle orecchiette pugliesi. Un mosaico di tradizioni che celebra la ricchezza culturale italiana.",
                    color: .green
                )
                
                CulturalAspectCard(
                    icon: "🌍",
                    title: "Porta d'Ingresso Culturale",
                    description: "La pasta italiana ha conquistato il mondo, diventando l'ambasciatore più amato della cultura italiana. In ogni ristorante italiano all'estero, un piatto di pasta racchiude secoli di storia e tradizione.",
                    color: .orange
                )
                
                CulturalAspectCard(
                    icon: "🎨",
                    title: "Arte e Artigianato",
                    description: "La produzione della pasta artigianale è un'arte che richiede maestria, pazienza e amore. Come gli antichi artigiani, i pastai moderni creano forme che sono vere opere d'arte culinaria.",
                    color: .purple
                )
                
                // UNESCO Heritage Section
                VStack(spacing: 20) {
                    Text("Patrimonio Immateriale")
                        .font(.title2)
                        .bold()
                    
                    Text("La pasta rappresenta un patrimonio culturale immateriale che merita di essere protetto e valorizzato. Il Museo della Pasta si propone come custode di questa tradizione millenaria, promuovendo la conoscenza e l'apprezzamento della cucina italiana nel mondo.")
                        .font(.body)
                        .lineSpacing(6)
                        .multilineTextAlignment(.center)
                        .padding(30)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.ultraThinMaterial)
                        }
                }
                .frame(maxWidth: 700)
                .padding(.horizontal)
                
                Spacer(minLength: 40)
            }
            .padding()
        }
    }
}

struct CulturalAspectCard: View {
    let icon: String
    let title: String
    let description: String
    let color: Color
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Text(icon)
                .font(.system(size: 60))
            
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(color)
                
                Text(description)
                    .font(.body)
                    .lineSpacing(5)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(25)
        .frame(maxWidth: 700)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.regularMaterial)
                .shadow(color: color.opacity(0.2), radius: 10, x: 0, y: 5)
        }
    }
}

#Preview{
    CultureView()
}
