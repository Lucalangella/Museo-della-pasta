# 🚀 Quick Start Guide - Museo della Pasta VisionOS App

## Running the Application

### Option 1: Using Xcode (Recommended)

1. **Open the Project**
   ```bash
   open MuseoDellaPasta.xcodeproj
   ```

2. **Select Simulator**
   - Choose "Apple Vision Pro" simulator from device menu

3. **Build and Run**
   - Press `Cmd + R` or click the "Run" button
   - Wait for app to build and launch in simulator

4. **Interact with App**
   - Use trackpad/mouse to navigate
   - Click on pasta models to rotate
   - Navigate between sections using the home cards

### Option 2: Command Line Build

```bash
cd /Users/lucalangella1/Documents/VisionOS/MuseoDellaPasta
xcodebuild -project MuseoDellaPasta.xcodeproj -scheme MuseoDellaPasta build
```

## Navigating the App

### 1. Home Screen
- **Welcome**: Overview of the museum experience
- **4 Feature Cards**: Quick access to sections
- **Interactive Preview**: Featured pasta with controls
- **Innovation Showcase**: Sustainability highlights

### 2. Explore Pasta Gallery
- **Grid View**: Browse all 6 pasta types
- **3D Models**: Rotating interactive models
- **Tap to Expand**: Full details and history
- **Controls**: Rotate, zoom, and reset

### 3. Historical Timeline
- **8 Events**: From 8000 BCE to 2025
- **Expand Details**: Tap events for more info
- **Chronological View**: Visual timeline layout

### 4. Culture Section
- **4 Aspects**: Traditional, regional, global, artistic
- **Rich Content**: Cultural significance of pasta
- **Heritage Focus**: UNESCO intangible heritage

### 5. Sustainability Section
- **ESG Framework**: Environmental, Social, Governance
- **Innovation**: AR/VR, AI, IoT technologies
- **Museum Vision**: Future-focused design principles

## Features

### Interactive 3D Models
- Tap pasta cards to view in detail
- Use rotate button to spin model
- Use zoom button to enlarge/reduce
- Press reset to restore position

### Navigation
- Use NavigationStack for smooth transitions
- Back button always available
- Sheet presentations for detail views
- Smooth animations throughout

### Visual Design
- Glass morphism effects
- Material backgrounds
- Gradient overlays
- Modern typography
- Hover effects on cards

## Troubleshooting

### Build Errors
```bash
# Clean build folder
rm -rf ~/Library/Developer/Xcode/DerivedData/MuseoDellaPasta-*

# Rebuild
xcodebuild clean build
```

### Simulator Issues
- Ensure visionOS Simulator is installed
- Check Xcode version (15.0+)
- Verify Vision Pro simulator is running

### Missing Models
- Ensure all 6 USDZ files are in `3D models/` folder:
  - agnolotti.usdz
  - farfalle.usdz
  - fusillo5.usdz
  - rigatoni.usdz
  - tagliatelle.usdz
  - Tortellazzo.usdz

## Testing Checklist

- [ ] App launches successfully
- [ ] Home screen displays correctly
- [ ] All 4 navigation cards work
- [ ] Pasta gallery loads all 6 models
- [ ] Interactive controls function
- [ ] Timeline expands and collapses
- [ ] Culture section displays properly
- [ ] Sustainability section shows ESG framework
- [ ] No crashes or console errors
- [ ] Smooth navigation between sections

## Development Notes

### Code Structure
- **ContentView.swift**: Main entry and navigation
- **PastaGalleryView.swift**: 3D gallery with interactions
- **HistoricalTimelineView.swift**: Chronological history
- **CultureView.swift**: Cultural aspects
- **SustainabilityView.swift**: ESG framework
- **MuseoDellaPastaApp.swift**: App configuration

### Key Technologies
- SwiftUI for UI
- RealityKit for 3D
- VisionOS for spatial computing
- USDZ for 3D models

### Design Patterns
- MVVM architecture
- NavigationStack
- State management with @State
- Reusable components
- Modular structure

## Next Steps

### For Competition
1. Fill out application form
2. Create 1-page PDF presentation
3. Package project files
4. Submit by November 3, 2025

### For Development
1. Add more pasta types
2. Implement recipes section
3. Add social sharing
4. Create virtual tours
5. Integrate with museum systems

## Support

### Competition Info
- **Fondazione Vincenzo Agnesi**
- **premiodelmuseo@fondazionevincenzoagnesi.it**
- **06 699 1119 / 06 699 1120**

### Technical Support
- Check README.md for full documentation
- Review PROJECT_SUMMARY.md for competition details
- Use SUBMISSION_CHECKLIST.md for submission prep

---

**Built with ❤️ for Italian cultural heritage**


