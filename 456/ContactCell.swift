//
//  ContactCell.swift
//  456
//
//  Created by Victoria Prigel on 13/09/2024.
//

import SwiftUI

struct ContactCell: View {
    
    @State private var showSheet = false
    @Binding var contacts: [Contact] // Hele contactlist
    @Binding var contact: Contact     // Spesifikk contact
    @Binding var archivedContacts: [ArchivedContact]
    
    var body: some View {
        
        HStack {
            
            ProfileImageView(contact: $contact)

            Text(contact.name)
          //      .font(.headline)
            Spacer()
            
            
            // ---- Hjerteikon ----
            Image(systemName: contact.isFavorite ? "heart.fill" : "heart")
                .padding(10)
                .foregroundColor(.red)
                .onTapGesture {
                    toggleFavorite()
                }
        }
        
        .contentShape(Rectangle()) // Gjør hele HStack klikkbar
        .onTapGesture {
            // Åpner sheet med mer informasjon
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            // Innholdet i sheet
            ContactDetailCell(contact: $contact, contacts: $contacts, archivedContacts: $archivedContacts)
                .presentationDetents([.fraction(0.2)])
                
        }
    }
    
    func toggleFavorite() {
        contact.isFavorite.toggle()
        
        // Oppdaterer hovedlisten med nye favorittstatusen
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[index].isFavorite = contact.isFavorite
        }
        
        // Lagre favorittstatus i UserDefaults med UUID
        UserDefaults.standard.set(contact.isFavorite, forKey: "\(contact.id)-isFavorite")
    }
}
