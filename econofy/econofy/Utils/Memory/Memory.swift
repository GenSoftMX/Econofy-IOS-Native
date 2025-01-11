//
//  Memory.swift
//  econofy
//
//  Created by Jesus Donaldo Sanchez Inzunza on 04/01/25.
//

import Foundation

/// `Memory` is a singleton class responsible for storing and retrieving app preferences using `UserDefaults`.
/// It focuses on managing  simple local persistent information
struct Memory {

    /// Shared instance of `Memory` for global access.
    static var shared = Memory()

    /// Reference to `UserDefaults`.
    private let defaults = UserDefaults.standard

    /// Keys used for storing and retrieving values from `UserDefaults`.
    private enum Keys: String {
        case hasCompletedOnboarding
        case currentLocale
        case hasSession
    }

    // MARK: - Properties

    /// Indicates whether the user has completed the onboarding process.
    /// - Returns: `true` if onboarding is completed, `false` otherwise.
    var hasCompletedOnboarding: Bool {
        get {
            return defaults.bool(forKey: Keys.hasCompletedOnboarding.rawValue)
        }
        set {
            defaults.set(newValue, forKey: Keys.hasCompletedOnboarding.rawValue)
        }
    }

    /// Stores the current locale of the app as a `String`.
    /// - Returns: The current locale as a `String`, or `nil` if not set.
    var currentLocale: String? {
        get {
            return defaults.string(forKey: Keys.currentLocale.rawValue)
        }
        set {
            defaults.set(newValue, forKey: Keys.currentLocale.rawValue)
        }
    }

    /// Indicates whether the user has an active session.
    /// - Returns: `true` if there is an active session, `false` otherwise.
    var hasSession: Bool {
        get {
            return defaults.bool(forKey: Keys.hasSession.rawValue)
        }
        set {
            defaults.set(newValue, forKey: Keys.hasSession.rawValue)
        }
    }

    // MARK: - Methods

    /// Clears all stored data for the defined keys in this class.
    ///
    /// This method removes `hasCompletedOnboarding`, `currentLocale`, and `hasSession` from `UserDefaults`.
    func clearAll() {
        let keys = [Keys.hasCompletedOnboarding, Keys.currentLocale, Keys.hasSession]
        keys.forEach { defaults.removeObject(forKey: $0.rawValue) }
    }
}
