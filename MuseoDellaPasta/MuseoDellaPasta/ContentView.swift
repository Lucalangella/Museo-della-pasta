//
//  ContentView.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 27/10/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State var selectedPasta: PastaType? = nil
    @State var showHistoricalTimeline = false
    @State var showPastaGallery = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image
                Image("spacePasta")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                HStack{
                    Spacer()
                    VStack{
                        Image("pastAppTitle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400)
                        
                        Image("pastAppSubtitle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400)
                        Button(action: {
                            showPastaGallery = true
                        }) {
                            Text("Esplora")
                                .font(.title)
                                .padding()
                        }
                        .navigationDestination(isPresented: $showPastaGallery) {
                            MainGalleryView()
                        }
                        .padding(.trailing, 250)
                    }
                    .padding(200)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


