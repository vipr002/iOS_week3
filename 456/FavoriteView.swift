//
//  FavoriteView.swift
//  456
//
//  Created by Victoria Prigel on 14/09/2024.
//

import SwiftUI

struct FavoriteView: View {
    
    @Binding var contacts: [Contact]
    @Binding var archivedContacts: [ArchivedContact]
    var removeFromContacts: (Contact) -> Void
    var searchedText: String
    var displayAsGrid: Bool
    
    var body: some View {
        
        if displayAsGrid {
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                ForEach(filteredFavoriteContacts, id: \.id) { contact in
                    if let contactIndex = contacts.firstIndex(where: { $0.id == contact.id }) {
                        ContactCell(contacts: $contacts, contact: $contacts[contactIndex], archivedContacts: $archivedContacts)
                            .onTapGesture {
                                removeFromContacts(contact)
                            }
                    }
                }
            }
        } else {
            
            ScrollView(.vertical) {
                
                VStack {
                    
                    // Filtreringslogikk for favoritter direkte inn i favoriteview
                    ForEach(filteredFavoriteContacts, id: \.id) { contact in
                        if let contactIndex = contacts.firstIndex(where: { $0.id == contact.id }) {
                            
                            
                            // Sende kontakter + spesifikk kontakt som binding til contactcell
                            ContactCell(contacts: $contacts, contact: $contacts[contactIndex], archivedContacts: $archivedContacts)
                                .onTapGesture {
                                    removeFromContacts(contact)
                                }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(5)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.green, lineWidth: 1)
            )
        }
    }
    
    // Filtrere favoritter basert på søketekst
    var filteredFavoriteContacts: [Contact] {
        return contacts.filter { contact in
            contact.isFavorite &&
            (searchedText.isEmpty || contact.name.lowercased().contains(searchedText.lowercased()))
        }
    }
}


/*
import SwiftUI

struct FavoriteView: View {
    
    @Binding var contacts: [Contact]
    @Binding var archivedContacts: [ArchivedContact]
    var removeFromContacts: (Contact) -> Void // Funksjon for å flytte kontakt tilbake til kontaktene
    var searchedText: String
    
    var body: some View {

        ScrollView(.vertical) {
            
            VStack {
                
                ForEach(favoriteContacts, id: \.id) { contact in
                    if let contactIndex = contacts.firstIndex(where: { $0.id == contact.id }) {
                        ContactCell(contacts: $contacts, contact: $contacts[contactIndex], archivedContacts: $archivedContacts)

                            .onTapGesture {
                                removeFromContacts(contact) // Fjern fra favoritter og flytt tilbake til kontakter
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(5)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.green, lineWidth: 1)
        )
    }
    
    // Hjelpe-funksjon for å filtrere favoritter
    var favoriteContacts: [Contact] {
        contacts.filter { $0.isFavorite }
    }
}
*/
