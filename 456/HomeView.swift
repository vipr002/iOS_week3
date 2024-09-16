//
//  HomeView.swift
//  456
//
//  Created by Victoria Prigel on 14/09/2024.
//


import SwiftUI

struct HomeView: View {
    
    @State var contacts: [Contact] = mocks // Hovedlisten for kontakter
    @State private var selectedContact: Contact?
    @State private var searchedText: String = ""
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Favorittseksjon
                    if !favoriteContacts.isEmpty {
                        Text("Favorites")
                            .font(.title)
                            .padding(.leading)
                        
                        FavoriteView(contacts: $contacts, removeFromContacts: moveToContacts, searchedText: searchedText)
                    }
                    
                    // Kontaktseksjon
                    if !nonFavoriteContacts.isEmpty {
                        Text("Contacts")
                            .font(.title)
                            .padding(.leading)
                        
                        
                        ContactView(contacts: $contacts, removeFromFavorites: moveToFavorites, searchedText: searchedText)
                    }
                }
                
                .padding()
            }
        }
        .searchable(text: $searchedText)
    }
    
    
    // Søkefunksjon
    func filteredContacts() -> [Contact] {
        guard !searchedText.isEmpty else { return contacts }
        return contacts.filter { contact in
            contact.name.lowercased().contains(searchedText.lowercased())
        }
    }
    
    // ---- * Håndtering av favoritt og ikke-favoritt kontakter * ----
    
    // Beregnet variabel for favorittkontakter
    var favoriteContacts: [Contact] {
        return contacts.filter { $0.isFavorite }
    }
    
    // Beregnet variabel for ikke-favorittkontakter
    var nonFavoriteContacts: [Contact] {
        return contacts.filter { !$0.isFavorite }
    }
    
    // Flytt kontakt til favorittlisten
    func moveToFavorites(contact: Contact) {
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[index].isFavorite = true
        }
    }
    
    // Flytt kontakt tilbake til kontaktlisten
    func moveToContacts(contact: Contact) {
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[index].isFavorite = false
        }
    }
}

#Preview {
    HomeView()
}
