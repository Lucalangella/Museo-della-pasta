# 🍝 Museo della Pasta Italiana - VisionOS

> Un viaggio immersivo nella tradizione culinaria italiana attraverso la tecnologia spatial computing

<img width="1280" height="828" alt="Screenshot 2025-11-02 at 18 05 37" src="https://github.com/user-attachments/assets/a682a251-6c8b-49bc-9af5-887b9d98c5b5" />

---

## 🏆 Riconoscimenti

**🥉 Terzo classificato — Premio del Museo, 25ª edizione · Sezione Università**

Il progetto **PastApp** ha conquistato il terzo posto nella Sezione Università della 25ª edizione del **Premio del Museo**, concorso promosso dalla **Fondazione Vincenzo Agnesi** e dedicato alla progettazione di un nuovo museo della pasta.

La cerimonia di premiazione si è svolta il **31 marzo 2026** nell'ambito di [Pastaria Fiera & Festival 2026](https://www.linkedin.com/posts/fondazionevincenzoagnesi_fondazionevincenzoagnesi-pastaria-pastariafestival-activity-7445105304050065408-rn72?utm_source=share&utm_medium=member_desktop&rcm=ACoAAD4bNrkB0-_SSrsmuGjEaBiJNKwcdeWGXUU) a Firenze, evento di riferimento per l'intera filiera della pasta, alla presenza di una giuria qualificata composta da esperti di sociologia, cultura, comunicazione e progettazione museale.

Il bando ha raccolto contributi da diverse università italiane, con proposte che spaziano dalla ricerca storico-umanistica alla progettazione architettonica, fino alle soluzioni digitali e di comunicazione innovativa.

> *Università degli Studi di Napoli Federico II — Luca Langella, Paola Campanile, Manuele Esposito*

---

## Descrizione del Progetto

**Museo della Pasta Italiana** è un'applicazione nativa per Apple Vision Pro che propone una nuova esperienza museale immersiva dedicata alla pasta italiana.

L'applicazione trasforma la storia millenaria della pasta in un'esperienza spaziale interattiva, dove tradizione e innovazione tecnologica si incontrano per valorizzare uno dei simboli più rappresentativi della cultura italiana.

### Team di Sviluppo

- **Luca Langella** - Sviluppo e Implementazione
- **Paola Campanile** - Design
- **Manuele Esposito** - Modellazione 3D

---

## ✨ Caratteristiche Principali

### 🥟 Galleria Interattiva della Pasta

Esplora 11 formati di pasta tradizionali italiani attraverso modelli 3D ad alta fedeltà:

- **Agnolotti** - Pasta ripiena piemontese
- **Farfalle** - Pasta a forma di farfalla lombarda
- **Fusillo** - Pasta elicoidale del Sud Italia
- **Rigatoni** - Pasta rigata laziale
- **Tagliatelle** - Pasta piatta emiliana
- **Tortello** - Pasta ripiena dell'Emilia-Romagna
- **Orecchietta** - Pasta pugliese a forma di orecchio
- **Conchiglia** - Pasta concava per sughi corposi
- **Riccioli** - Pasta riccia del Sud Italia
- **Rigatone Curvo** - Variante arcuata del rigatone
- **Spaghetti** - L'icona della pasta italiana nel mondo

Ogni formato include:
- Modello 3D manipolabile nello spazio
- Storia e origine regionale
- Descrizione delle caratteristiche
- Suggerimenti di utilizzo

### 🛠️ Collezione degli Utensili

Scopri gli strumenti tradizionali che hanno plasmato la cultura della pasta:

- **Chitarra Abruzzese** - Per tagliare i maccheroni alla chitarra
- **Macchina per Pasta** - L'innovazione nella produzione casalinga
- **Mattarello** - Simbolo della tradizione familiare
- **Torchietto** - Per modellare paste tipiche regionali

### Esperienza Immersiva

- **Visualizzazione Volumetrica**: I modelli 3D fluttuano nello spazio circostante
- **Interazione Naturale**: Manipola, ruota e esplora ogni oggetto con gesti intuitivi
- **Interfaccia Spaziale**: Design che sfrutta appieno le capacità del Vision Pro
- **Ornamenti Informativi**: Schede descrittive ancorate allo spazio 3D

---

## Architettura Tecnica

### Stack Tecnologico

- **SwiftUI**: Framework dichiarativo per l'interfaccia utente
- **RealityKit**: Motore di rendering 3D e fisica
- **VisionOS 2.6**: Sistema operativo spatial computing di Apple
- **Swift 6.2**: Linguaggio di programmazione moderno e sicuro
- **USDZ**: Formato universale per modelli 3D ottimizzato

### Struttura del Progetto

```
MuseoDellaPasta/
├── MuseoDellaPastaApp.swift       # Entry point dell'applicazione
├── ContentView.swift               # Schermata principale
├── Models/
│   ├── PastaModel.swift           # Modelli dati per i formati di pasta
│   ├── UtensilModel.swift         # Modelli dati per gli utensili
│   └── TimelineModel.swift        # Eventi storici
├── Views/
│   ├── MainGalleryView.swift     # Navigazione tra sezioni
│   ├── PastaGallery/
│   │   ├── PastaGalleryView.swift
│   │   ├── PastaCard.swift
│   │   └── PastaVolumeView.swift
│   └── Utensili/
│       ├── UtensilGalleryView.swift
│       ├── UtensilCard.swift
│       └── UtensilVolumeView.swift
├── Assets.xcassets/               # Risorse grafiche
└── 3D models/
    ├── pasta 3D/                  # Modelli USDZ delle paste
    └── utensili/                  # Modelli USDZ degli utensili
```

### Pattern Architetturali

- **MVVM**: Separazione tra logica e presentazione
- **Modularità**: Componenti riutilizzabili e indipendenti
- **State Management**: Gestione reattiva dello stato con `@State` e `@Environment`
- **WindowGroup Multiple**: Finestre volumetriche dedicate per l'esplorazione 3D

---

## Installazione e Utilizzo

### Scarica l'App su App Store

**Vuoi provare l'esperienza subito? Scarica l'applicazione completa per Apple Vision Pro:**
**[Scarica su AppStore](https://apps.apple.com/us/app/pastapp-museo-della-pasta/id6754823065)** 🎯

> **Requisiti**: Apple Vision Pro con visionOS 2.0 o superiore

### Requisiti di Sistema per lo Sviluppo

- **Xcode 16.0** o superiore
- **macOS Sequoia 15.0** o superiore
- **Vision Pro Simulator** o dispositivo fisico
- **Swift 6.2**

### Installazione per Sviluppatori

1. **Clona il repository**
```bash
git clone https://github.com/lucalangella/Museo-della-pasta.git
cd Museo-della-pasta/MuseoDellaPasta
```

2. **Apri il progetto in Xcode**
```bash
open MuseoDellaPasta.xcodeproj
```

3. **Seleziona il target**
   - Scegli "Apple Vision Pro" dal menu dei simulatori
   - Oppure connetti un Vision Pro fisico

4. **Compila ed esegui**
   - Premi `⌘ + R` o clicca sul pulsante "Run"
   - L'app si avvierà nel simulatore o sul dispositivo

### Navigazione nell'App

1. **Schermata Iniziale**: Premi "Esplora" per accedere alla galleria
2. **Sezioni**: Scegli tra "Pasta" e "Utensili" tramite i tab superiori
3. **Griglia**: Sfoglia la collezione completa di modelli 3D
4. **Vista Dettaglio**: Tocca una card per aprire la vista volumetrica immersiva
5. **Interazione**: Usa i gesti naturali per manipolare i modelli nello spazio

---

## 🎨 Design e User Experience

### Principi di Design

- **Spatial First**: Interfaccia pensata nativamente per lo spazio tridimensionale
- **Glassmorphism**: Effetti materiali che si integrano con l'ambiente
- **Minimalismo Funzionale**: Focus sui contenuti, interfaccia pulita
- **Accessibilità**: Navigazione intuitiva e universale

### Palette Cromatica

- **Background**: Immagine custom "SpacePasta" immersiva
- **Cards**: Effetto vetro con `.regularMaterial`
- **Testo**: Gerarchie chiare con dimensioni da 28pt a 54pt
- **Accenti**: Colori naturali che richiamano ingredienti e tradizione

---

## Obiettivi del Progetto

### Valorizzazione Culturale

Il progetto propone un modello museale innovativo che:
- Valorizza il patrimonio culturale italiano
- Combina storia, tecnologia e design in modo armonioso
- Crea un'esperienza educativa e coinvolgente

### Sostenibilità

- **Economica**: Modello scalabile e mantenibile nel tempo
- **Culturale**: Valorizzazione del patrimonio immateriale UNESCO
- **Sociale**: Accessibilità universale e valore educativo
- **Innovazione**: Tecnologie sostenibili per la conservazione digitale

---

## Innovazione Tecnologica

### Spatial Computing

L'applicazione sfrutta appieno le capacità del Vision Pro:
- **Rendering 3D Real-time**: Modelli ad alta fedeltà
- **Interazione Naturale**: Controlli gestuali intuitivi
- **Presenza Spaziale**: Gli oggetti coesistono con l'ambiente fisico
- **Window Management**: Finestre multiple per esperienze contestuali

---

## 📄 Licenza

Questo progetto è rilasciato sotto licenza **MIT License**.

Copyright (c) 2025 Luca Langella, Paola Campanile, Manuele Esposito

Consulta il file [LICENSE](LICENSE) per i dettagli completi.

---

**Fatto con ❤️ per la cultura italiana**

🇮🇹 🍝 ✨

*Un museo che guarda al futuro senza dimenticare le sue radici*
