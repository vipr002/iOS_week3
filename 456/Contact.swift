//
//  Contact.swift
//  456
//
//  Created by Victoria Prigel on 13/09/2024.
//

import Foundation

struct Contact: Identifiable, Codable {
    let id: UUID
    var name: String
    var phoneNumber: String?  // endres til required hvis nødvendig
    var imageName: String?
    var isFavorite: Bool
    var isArchived: Bool = false
    var archivedAt: Date? = nil
}

struct ArchivedContact: Identifiable, Codable {
    var id: UUID { contact.id }
    var contact: Contact  
    var archivedAt: Date
}

// Sette dato for arkivert når kontakt arkiveres
func archiveContact(contact: inout Contact) {
    contact.isArchived = true
    contact.archivedAt = Date()
}

// Formattere datoverdi
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    return formatter
}()
