//
//  ContentView.swift
//  456
//
//  Created by Victoria Prigel on 13/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var contacts: [Contact] = mocks
    @State private var selectedContact: Contact? // Holder styr på den valgte kontakten
    @State private var isShowingDetails = false // Brukes for å kontrollere om sheet skal vises
    
    var body: some View {
        
        VStack {
            TabView {
                
                HomeView()
                .tabItem {
                    Label("Contacts", systemImage: "person.fill")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
