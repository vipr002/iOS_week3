//
//  ContentView.swift
//  456
//
//  Created by Victoria Prigel on 13/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var contacts: [Contact] = []
    @State var archivedContacts: [ArchivedContact] = []
    @State private var selectedContact: Contact? // Holder styr på den valgte kontakten
    @State private var isShowingDetails = false // Brukes for å kontrollere om sheet skal vises
    
  
    func loadContacts() {
        contacts = mocks
        
        // Oppdater favorittstatus fra UserDefaults
        for index in contacts.indices {
            let contactID = contacts[index].id
            if let savedFavoriteStatus = UserDefaults.standard.object(forKey: "\(contactID)-isFavorite") as? Bool {
                contacts[index].isFavorite = savedFavoriteStatus
            }
        }
    }
    
    var body: some View {
        
        VStack {
            
            TabView {
                
                ArchivedList(archivedContacts: $archivedContacts, contacts: $contacts)
                    .tabItem {
                        Label("Archive", systemImage: "tray.fill")
                    }
                
                HomeView(contacts: $contacts, archivedContacts: $archivedContacts)
                .tabItem {
                    Label("Contacts", systemImage: "person.fill")
                }
                
                SettingsView(contacts: $contacts)
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
            }
        }
        .onAppear {
            loadContacts()
        }
    }
}

// TO DO:
// Persist the favorite status, such that relaunching the application doesn’t modify the app data.
