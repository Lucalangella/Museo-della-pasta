//
// PastaModel.swift
// MuseoDellaPasta
//
// Created by Luca Langella 1 on 31/10/25.
//

import Foundation

// MARK: - Pasta Type Model

enum PastaType: String, CaseIterable, Identifiable {
    case agnolotti = "Agnolotti"
    case farfalle = "Farfalle"
    case fusillo = "Fusillo"
    case rigatoni = "Rigatoni"
    case tagliatelle = "Tagliatelle"
    case tortello = "Tortello"
    case orecchietta = "Orecchietta"
    
    var id: String { rawValue }
    
    var modelName: String {
        switch self {
        case .agnolotti: return "agnolotti"
        case .farfalle: return "farfalle"
        case .fusillo: return "fusillo"
        case .rigatoni: return "rigatoni"
        case .tagliatelle: return "tagliatelle"
        case .tortello: return "tortello"
        case .orecchietta: return "orecchietta"
        }
    }
    
    var description: String {
        switch self {
        case .agnolotti:
            return "Pasta ripiena tradizionale del Piemonte"
        case .farfalle:
            return "Pasta a forma di farfalla del Nord Italia"
        case .fusillo:
            return "Pasta corta a forma elicoidale"
        case .rigatoni:
            return "Pasta corta larga con rigature"
        case .tagliatelle:
            return "Pasta lunga piatta dell'Emilia-Romagna"
        case .tortello:
            return "Pasta ripiena tradizionale del Nord Italia"
        case .orecchietta:
            return "Pasta tipica pugliese a forma di orecchio"
        }
    }
    
    var history: String {
        switch self {
        case .agnolotti:
            return "Gli agnolotti nascono nel Piemonte medievale e rappresentano una delle paste ripiene più antiche d'Italia."
        case .farfalle:
            return "Le farfalle sono state inventate in Lombardia nel XVI secolo, ispirandosi alla forma delle ali delle farfalle."
        case .fusillo:
            return "Originaria del Sud Italia, il fusillo è una pasta con la forma dell'elica, ideale per trattenere i sughi."
        case .rigatoni:
            return "I rigatoni, con le loro caratteristiche rigature, sono nati nel Lazio e sono perfetti per i sughi corposi."
        case .tagliatelle:
            return "Le tagliatelle sono patrimonio dell'Emilia-Romagna e rappresentano l'essenza della cucina bolognese."
        case .tortello:
            return "Il tortello, variante del tortellino, è simbolo della gastronomia emiliana di antica tradizione."
        case .orecchietta:
            return "Le orecchiette sono il simbolo della cucina pugliese e risalgono al Medioevo, tradizionalmente fatte in casa."
        }
    }
}
