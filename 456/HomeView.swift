//
//  HomeView.swift
//  456
//
//  Created by Victoria Prigel on 14/09/2024.
//


import SwiftUI

struct HomeView: View {
    
    @Binding var contacts: [Contact]
    @Binding var archivedContacts: [ArchivedContact]
    @State private var searchedText: String = ""
    @State private var displayAsGrid: Bool = UserDefaults.standard.bool(forKey: "displayAsList")
    @State private var showSheet = false
    
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Button(action: {
                        showSheet.toggle()
                    },
                           label: {
                        Image(systemName: "plus.circle.fill")
                        Text("New Contact")
                    })
                    .padding(8)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    
                    // Vis favorite contacts
                    if !filteredFavoriteContacts.isEmpty {
                        Text("Favorites")
                            .font(.title)
                            .padding(.leading)
                        
                        
                        FavoriteView(contacts: $contacts, archivedContacts: $archivedContacts, removeFromContacts: { contact in
                            moveToContacts(contact: contact)
                        }, searchedText: searchedText, displayAsGrid: displayAsGrid)
                    }
                    
                    // Vise ikke-favoritter
                    if !filteredNonFavoriteContacts.isEmpty {
                        Text("Contacts")
                            .font(.title)
                            .padding(.leading)
                        
                        
                        ContactView(contacts: $contacts, archivedContacts: $archivedContacts, removeFromFavorites: { contact in
                            moveToFavorites(contact: contact)
                        }, searchedText: searchedText)
                    }
                }
                .padding()

                .sheet(isPresented: $showSheet) {
                    ModifierView(onSave: { newContact in
                        // Legg den nye kontakten til i kontaktlisten
                        contacts.append(newContact)
                        showSheet = false // Lukk sheet når kontakten er lagret
                    })
                    .presentationDetents([.fraction(0.4)])
                }
            }
        }
        .searchable(text: $searchedText)
    }
    
    // Filtrere favoritter basert på søketekst
    var filteredFavoriteContacts: [Contact] {
        return contacts.filter { contact in
            contact.isFavorite &&
            (searchedText.isEmpty || contact.name.lowercased().contains(searchedText.lowercased()))
        }
    }
    
    // Filtrere ikke-favoritter basert på søketekst
    var filteredNonFavoriteContacts: [Contact] {
        return contacts.filter { contact in
            !contact.isFavorite && !contact.isArchived &&
            (searchedText.isEmpty || contact.name.lowercased().contains(searchedText.lowercased()))
        }
    }
    
    // Flytte kontakt til favoritter
    func moveToFavorites(contact: Contact) {
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[index].isFavorite = true
        }
    }
    
    // Flytte tilbake til kontakter
    func moveToContacts(contact: Contact) {
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[index].isFavorite = false
        }
    }
}

/*

 func filteredContacts(isFavorite: Bool) -> [Contact] {
     if isFavorite {
         return contacts.filter { $0.isFavorite }
     } else {
         return contacts.filter { !$0.isFavorite }
     }
 }
 */
