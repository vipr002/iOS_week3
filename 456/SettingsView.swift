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
    
    var body: some View {
        
        VStack {
        
            // Toggle for enabling/disabling favorites
            Toggle("Enable Favorites", isOn: $enableFavorites)
                .onChange(of: enableFavorites) { newValue in
                    if !newValue {
                       // unfavoriteAllContacts()
                    }
                }
                .padding()
            
            // grid/list toggle
            Toggle("Display Contacts as List", isOn: .constant(true))
                .padding()
            
        } // VStack
        .padding(.vertical)
    }
    
    /* Fjerne alle favoritter
    func unfavoriteAllContacts() {
        for index in contacts.indices {
            contacts[index].isFavorite = false
        }
    }*/
}

#Preview {
    SettingsView(contacts: .constant(mocks))
}


#Preview {
    SettingsView(contacts: .constant(mocks)) 
}


// Remove the Favorite Status of All Contacts
// Toggle Between Displaying Favorite Contacts as a Grid or List
