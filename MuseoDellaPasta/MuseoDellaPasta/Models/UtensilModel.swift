//
// UtensilModel.swift
// MuseoDellaPasta
//
// Created by Luca Langella 1 on 31/10/25.
//

import Foundation

// MARK: - Utensil Type Model

enum UtensilType: String, CaseIterable, Identifiable {
    case chitarra = "Chitarra"
    case macchina = "Macchina"
    case mattarello = "Mattarello"
    case torchietto = "Torchietto"
    
    var id: String { rawValue }
    
    var modelName: String {
        switch self {
        case .chitarra: return "chitarra"
        case .macchina: return "macchina"
        case .mattarello: return "mattarello"
        case .torchietto: return "torchietto"
        }
    }
    
    var description: String {
        switch self {
        case .chitarra:
            return "Strumento tradizionale per tagliare la pasta a mano"
        case .macchina:
            return "Macchina per la produzione di pasta fresca"
        case .mattarello:
            return "Strumento fondamentale per stendere la pasta"
        case .torchietto:
            return "Utensile tradizionale per modellare la pasta"
        }
    }
    
    var history: String {
        switch self {
        case .chitarra:
            return "La chitarra è uno strumento tradizionale italiano utilizzato per tagliare la pasta a mano. Consiste in fili d'acciaio tesi su un telaio di legno, come le corde di una chitarra, da cui prende il nome. Tradizionalmente usata in Abruzzo e altre regioni per produrre i maccheroni alla chitarra."
        case .macchina:
            return "La macchina per la pasta è un'innovazione moderna che ha rivoluzionato la produzione domestica della pasta. Permette di stendere e tagliare la pasta fresca con facilità, rendendo accessibile a tutti la produzione artigianale."
        case .mattarello:
            return "Il mattarello è uno degli utensili più antichi e simbolici della cucina italiana. Utilizzato per stendere la pasta fresca, rappresenta la tradizione della pasta fatta in casa. Ogni famiglia italiana conserva il proprio mattarello, spesso tramandato di generazione in generazione."
        case .torchietto:
            return "Il torchietto è uno strumento tradizionale utilizzato per modellare e tagliare la pasta in forme specifiche. Usato soprattutto nel Sud Italia, permette di creare paste tipiche come i cavatelli e altre specialità regionali."
        }
    }
}

