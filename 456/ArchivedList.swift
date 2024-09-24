//
//  ArchivedList.swift
//  456
//
//  Created by Victoria Prigel on 18/09/2024.
//

import SwiftUI


struct ArchivedList: View {
    
    @Binding var archivedContacts: [ArchivedContact]
    @Binding var contacts: [Contact]
    @State private var selectedContact: Contact?
    
    private let contactsRepository = ContactsRepository()
    
    var body: some View {
        
        List {
            
            if archivedContacts.isEmpty {
                Text("You have no archived contacts")
                
            } else {
                
                ForEach($archivedContacts) { $archivedContact in
                    ArchivedCell(contact: $archivedContact.contact, archivedContact: $archivedContact)
                    
                        .swipeActions(allowsFullSwipe: false) {
                            Button("Restore") {
                                selectedContact = archivedContact.contact
                                print("Restore button pressed for contact: \(archivedContact.contact.name)")
                                restore(archivedContact.contact)  // restore
                            }.tint(.blue)
                        }
                    
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button("Delete") {
                                selectedContact = archivedContact.contact
                                delete(archivedContact.contact)  // delete
                            }.tint(.red)
                        }
                }
            }
        }
        .navigationTitle("Archived Contacts")
    }
    
    private func restore(_ contact: Contact) {
        if let foundIndex = archivedContacts.firstIndex(where: { $0.contact.id == contact.id }) {
            
            archivedContacts[foundIndex].contact.isArchived = false
            archivedContacts[foundIndex].contact.archivedAt = nil
            archivedContacts[foundIndex].contact.isFavorite = false

            // Legger restored contact tilbake til contactlist hvis den ikke finnes fra før
            if !contacts.contains(where: { $0.id == archivedContacts[foundIndex].contact.id }) {
                contacts.append(archivedContacts[foundIndex].contact)
            } else {
                print("Contact \(archivedContacts[foundIndex].contact.name) already exists in the contacts list.")
            }

            // Fjerner fra arkiverte kontakter
            archivedContacts.remove(at: foundIndex)

            // Lagrer både oppdatert contacts og archivedContacts
            contactsRepository.saveContacts(contacts)
            contactsRepository.saveArchivedContacts(archivedContacts)
        }
    }


    private func delete(_ contact: Contact) {
        if let foundIndex = archivedContacts.firstIndex(where: { $0.contact.id == contact.id }) {
            archivedContacts.remove(at: foundIndex)
            print("Deleted contact: \(contact.name)")
        }
    }
    
    static func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
