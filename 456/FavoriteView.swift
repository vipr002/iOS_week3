//
//  FavoriteView.swift
//  456
//
//  Created by Victoria Prigel on 14/09/2024.
//

import SwiftUI

struct FavoriteView: View {
    
    @Binding var contacts: [Contact]
    var removeFromContacts: (Contact) -> Void // Funksjon for å flytte kontakt tilbake til kontaktene
    
    var body: some View {

        ScrollView(.vertical) {
            
            VStack {
                
                ForEach(contacts.filter { $0.isFavorite }) { contact in
                    ContactCell(contact: $contacts[contacts.firstIndex(where: { $0.id == contact.id })!])
                        .onTapGesture {
                            removeFromContacts(contact) // Fjern fra favoritter og flytt tilbake til kontakter
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
