//
//  ContactDetailsView.swift
//  456
//
//  Created by Victoria Prigel on 14/09/2024.
//

import SwiftUI

struct ContactDetailsView: View {
    
    @Binding var contact: Contact
    var toggleFavorite: () -> Void
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                ProfileImageView(contact: $contact)
                
                Text(contact.name)
                    .font(.headline)
                Spacer()
                
                // ---- Hjerteikonet ----
                Image(systemName: contact.isFavorite ? "heart.fill" : "heart")
                    .padding(10)
                    .foregroundColor(.red)
                    .onTapGesture {
                        toggleFavorite()
                    }
            }
        }
        .padding()
    }
}
