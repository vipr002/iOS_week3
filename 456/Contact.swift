//
//  Contact.swift
//  456
//
//  Created by Victoria Prigel on 13/09/2024.
//

import Foundation
import SwiftUI

struct Contact: Identifiable {
    let id: UUID
    var name: String
    var phoneNumber: String?
    var imageName: String?
    var isFavorite: Bool
    var isArchived: Bool = false
    var archivedAt: Date? = nil
}


// Sette dato for arkivert når kontakt arkiveres
func archiveContact(contact: inout Contact) {
    contact.isArchived = true
    contact.archivedAt = Date()
}


// Formattere date verdi
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    return formatter
}()
