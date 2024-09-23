//
//  ContactsRepository.swift
//  456
//
//  Created by Victoria Prigel on 22/09/2024.
//

import Foundation

class ContactsRepository {
    
    private let contactsKey = "contacts"
    private let archivedContactsKey = "archivedContacts"
    
    
    // laste kontakter fra UserDefaults
    func loadContacts() -> [Contact] {
        if let data = UserDefaults.standard.data(forKey: contactsKey) {
            do {
                let contacts = try JSONDecoder().decode([Contact].self, from: data)
                print("Contacts loaded successfully: \(contacts.map { $0.isFavorite })")
                return contacts
            } catch {
                print("Error decoding contacts: \(error)")
                return []
            }
        } else {
            return []  // Returnerer tomt array dersom ingen data er lagret
        }
    }
    
    func loadArchivedContacts() -> [ArchivedContact] {
        if let data = UserDefaults.standard.data(forKey: archivedContactsKey) {
            do {
                let archivedContacts = try JSONDecoder().decode([ArchivedContact].self, from: data)
                return archivedContacts
            } catch {
                print("Error decoding archived contacts: \(error)")
                return []
            }
        } else {
            return []  // Returnerer tomt array dersom ingen data er lagret
        }
    }
    
    
    // lagrer kontakter til UserDefaults
    func saveContacts(_ contacts: [Contact]) {
        do {
            let data = try JSONEncoder().encode(contacts)
            UserDefaults.standard.set(data, forKey: contactsKey)
            print("Contacts saved successfully.")
        } catch {
            print("Error saving contacts: \(error)")
        }
    }
    
    // Lagrer arkiverte kontakter til UserDefaults
    func saveArchivedContacts(_ archivedContacts: [ArchivedContact]) {
        do {
            let data = try JSONEncoder().encode(archivedContacts)
            UserDefaults.standard.set(data, forKey: archivedContactsKey)
        } catch {
            print("Error saving archived contacts: \(error)")
        }
    }
}
