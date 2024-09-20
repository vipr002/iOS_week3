//
//  SettingsView.swift
//  456
//
//  Created by Victoria Prigel on 17/09/2024.
//

import SwiftUI

struct SettingsView: View {
    
        @Binding var contacts: [Contact]
        @State private var enableFavorites: Bool = true
        @State private var displayAsGrid: Bool = UserDefaults.standard.bool(forKey: "displayAsList")
    
    var body: some View {
        
        VStack {
            
            Toggle("Favorites", isOn: $enableFavorites)
                .onChange(of: enableFavorites) { oldValue, newValue in
                    if !newValue {
                        unfavoriteAllContacts()
                    }
                }
                .padding()
            

            // https://www.hackingwithswift.com/books/ios-swiftui/storing-user-settings-with-userdefaults
            Toggle("Display Favorites as Grid", isOn: $displayAsGrid)
                .onChange(of: displayAsGrid) { oldValue, newValue in
                    UserDefaults.standard.set(newValue, forKey: "displayAsList")
                }
                .padding()
        } 
        .padding(.vertical)
    }
    
    // Fjerne alle favoritter
    func unfavoriteAllContacts() {
        for index in contacts.indices {
            if contacts[index].isFavorite {
                contacts[index].isFavorite = false
            }
        }
    }
}
