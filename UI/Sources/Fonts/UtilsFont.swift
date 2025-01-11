//
//  UtilsFont.swift
//  CustomUI
//
//  Created by Jesus Donaldo Sanchez Inzunza on 09/01/25.
//


import UIKit
import UIKit
import CoreText

public class FontRegistrar: @unchecked Sendable {
    
    static let shared = FontRegistrar()
    
    private var registeredFonts = Set<String>()
    
    private init() {}
    
    func registerFontIfNeeded(named fontName: String) {
        // Evitar volver a registrar la misma fuente.
        guard !registeredFonts.contains(fontName) else { return }
        
        do {
            try registerFont(named: fontName)
            registeredFonts.insert(fontName)
        } catch {
            print("Failed to register font: \(error.localizedDescription)")
        }
    }
    
    private func registerFont(named name: String) throws {
        // Busca el archivo de la fuente en el directorio Fonts
        guard let fontURL = Bundle.module.url(forResource: name, withExtension: "ttf") else {
            throw FontError.failedToRegisterFont("Font file not found for: \(name). Make sure the font is included in the bundle.")
        }
        
        // Carga el archivo de la fuente
        guard let fontData = try? Data(contentsOf: fontURL) else {
            throw FontError.failedToRegisterFont("Failed to load data for font file: \(name)")
        }
        
        // Crea un proveedor de datos con la fuente
        guard let provider = CGDataProvider(data: fontData as NSData) else {
            throw FontError.failedToRegisterFont("Failed to create CGDataProvider for font: \(name)")
        }
        
        // Crea el objeto CGFont desde el proveedor de datos
        guard let font = CGFont(provider) else {
            throw FontError.failedToRegisterFont("Failed to create CGFont for font: \(name)")
        }
        
        // Registra la fuente usando CTFontManager
        let registrationSuccess = CTFontManagerRegisterGraphicsFont(font, nil)
        
        // Verifica si la fuente se registró correctamente
        if !registrationSuccess {
            throw FontError.failedToRegisterFont("Failed to register font: \(name)")
        }
        
        // Añade la fuente al conjunto de fuentes registradas
        registeredFonts.insert(name)
        print("Font \(name) successfully registered.")
    }
}

/// Tipos de error relacionados con el registro de fuentes.
enum FontError: Error {
    case failedToRegisterFont(String)
    
    var localizedDescription: String {
        switch self {
        case .failedToRegisterFont(let message):
            return message
        }
    }
}
