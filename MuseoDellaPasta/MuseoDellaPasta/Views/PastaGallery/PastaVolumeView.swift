//
//  PastaVolumeView.swift
//  MuseoDellaPasta
//
//  Created by Luca Langella 1 on 31/10/25.
//

import SwiftUI
import RealityKit // Still needed if you use any RealityKit types elsewhere, but not for Model3D itself

struct PastaVolumeView: View {
    let modelName: String
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.openWindow) private var openWindow
    @State var rotation: Angle = .zero
    @State var scale: CGFloat = 0.5 // Initial scale for Model3D
    
    private var pastaType: PastaType? {
        PastaType.allCases.first { $0.modelName == modelName }
    }
    
    var body: some View {
          VStack {
              Model3D(named: modelName, bundle: .main) { model in
                  model
                      .resizable() // Allow the model to be resized by the frame
                      .aspectRatio(contentMode: .fit) // Fit the model within the frame while maintaining aspect ratio
                      .manipulable()
              } placeholder: {
                  ProgressView() // Show a loading indicator
              }
              .frame(width: 350, height: 350)
              .padding(.leading, 120) // Shift model right to avoid overlapping the trailing ornament
          }
          // Reserve space at the scene's trailing edge so the ornament doesn't overlap the model
          .scenePadding(.trailing)
          .padding(.trailing, 520)
          .ornament(attachmentAnchor: .scene(.trailing)) {
              ScrollView {
                  VStack(alignment: .leading, spacing: 12) {
                      if let pastaType {
                          Text(pastaType.rawValue)
                              .font(.system(size: 42))
                              .bold()
                          Text(pastaType.description)
                              .font(.system(size: 32))
                              .foregroundStyle(.secondary)
                          Divider()
                          Text("Storia")
                              .font(.system(size: 36))
                              .bold()
                          Text(pastaType.history)
                              .font(.system(size: 28))
                              .lineLimit(nil)
                              .fixedSize(horizontal: false, vertical: true)
                      } else {
                          Text(modelName.capitalized)
                              .font(.title)
                              .bold()
                          Text("Descrizione non disponibile")
                              .font(.body)
                              .foregroundStyle(.secondary)
                      }
                  }
                  .padding(16)
              }
              .frame(maxWidth: 480, maxHeight: 600, alignment: .leading)
              .glassBackgroundEffect()
          }
      }
    
//    var body: some View {
//        VStack {
//            Model3D(named: modelName, bundle: .main) { model in
//                model
//                    .resizable() // Allow the model to be resized by the frame
//                    .aspectRatio(contentMode: .fit) // Fit the model within the frame while maintaining aspect ratio
//                    .rotation3DEffect(
//                        rotation,
//                        axis: (x: 1.0, y: 1.0, z: 1.0) // Rotate around the Y-axis
//                    )
//                    .scaleEffect(scale) // Apply the scale from the slider
//            } placeholder: {
//                ProgressView() // Show a loading indicator
//            }
//            // Set a large enough frame for the 3D model to be clearly visible in the volume
//            // You might need to adjust this and the initial `scale` state for optimal size.
//            .frame(width: 400, height: 400)
//            .gesture(
//                DragGesture()
//                    .onChanged { value in
//                        // Update rotation based on drag gesture
//                        // We're adding to the current rotation, not setting it absolutely from 0.
//                        // This allows continuous rotation.
//                        rotation = Angle(degrees: rotation.degrees + Double(value.translation.width) * 0.5)
//                    }
//            )
//
//            // Slider to control the scale
//            Slider(value: $scale, in: 0.1...2.0) { // Adjusted range for better control
//                Text("Model Scale")
//            } minimumValueLabel: {
//                Image(systemName: "minus.circle")
//            } maximumValueLabel: {
//                Image(systemName: "plus.circle")
//            }
//            .padding()
//            .glassBackgroundEffect()
//            .frame(width: 300)
//        }
//        .toolbar {
//            ToolbarItemGroup(placement: .bottomOrnament) {
//                Button {
//                    withAnimation {
//                        rotation.degrees -= 45 // Rotate counter-clockwise
//                    }
//                } label: {
//                    Label("Rotate", systemImage: "arrow.counterclockwise")
//                }
//
//                Button {
//                    // Reset rotation and scale to initial values
//                    withAnimation {
//                        rotation = .zero
//                        scale = 0.5
//                    }
//                } label: {
//                    Label("Reset", systemImage: "arrow.uturn.backward")
//                }
//
//                Button {
//                    dismissWindow(id: "pastaVolume")
//                } label: {
//                    Label("Close", systemImage: "xmark.circle")
//                }
//            }
//        }
//    }
}

#Preview {
    PastaVolumeView(modelName: "agnolotti")
}
