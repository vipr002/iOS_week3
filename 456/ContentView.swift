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
    
    private let contactsRepository = ContactsRepository()
    
    
    var body: some View {
        
        VStack {
            
            TabView {
                
                HomeView(contacts: $contacts, archivedContacts: $archivedContacts)
                .tabItem {
                    Label("Contacts", systemImage: "person.fill")
                }
                
                ArchivedList(archivedContacts: $archivedContacts, contacts: $contacts)
                    .tabItem {
                        Label("Archive", systemImage: "tray.fill")
                    }
                
                SettingsView(contacts: $contacts)
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
            }
        }
        
        .onAppear {
            
            Task {
                await loadData()
                }
        }
    }
    
    func loadData() async {
        contacts = await contactsRepository.loadContacts()
        archivedContacts = await contactsRepository.loadArchivedContacts()
    }
}
