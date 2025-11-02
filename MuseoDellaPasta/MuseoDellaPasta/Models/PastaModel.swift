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
    case conchiglia = "Conchiglia"
    case riccioli = "Riccioli"
    case rigatoneCurvo = "Rigatone Curvo"
    case spaghetti = "Spaghetti"
    
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
        case .conchiglia: return "conchiglia"
        case .riccioli: return "riccioli"
        case .rigatoneCurvo: return "rigatone curvo"
        case .spaghetti: return "spaghetti"
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
        case .conchiglia:
            return "Pasta a forma di conchiglia, perfetta per i sughi"
        case .riccioli:
            return "Pasta corta riccia caratteristica del Sud Italia"
        case .rigatoneCurvo:
            return "Pasta rigata con forma curva, ideale per sughi corposi"
        case .spaghetti:
            return "La pasta lunga più famosa al mondo"
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
        case .conchiglia:
            return "Le conchiglie, con la loro forma concava, sono nate nel Sud Italia e sono perfette per trattenere sughi e condimenti."
        case .riccioli:
            return "I riccioli sono una pasta tipica del Sud Italia, caratterizzata dalla forma riccia che cattura perfettamente i sughi."
        case .rigatoneCurvo:
            return "Il rigatone curvo è una variante del rigatone tradizionale, con una forma arcuata che lo rende unico."
        case .spaghetti:
            return "Gli spaghetti sono la pasta italiana più iconica e conosciuta al mondo, originari di Napoli, diventati simbolo della cucina italiana nel globo."
        }
    }
}
