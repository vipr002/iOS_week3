//
//  ContactCell.swift
//  456
//
//  Created by Victoria Prigel on 13/09/2024.
//

import SwiftUI

struct ContactCell: View {
    
    @State private var showSheet = false
    @Binding var contacts: [Contact] // Hele contactlist
    @Binding var contact: Contact     // Spesifikk contact
    @Binding var archivedContacts: [ArchivedContact]
    
    var body: some View {
        
        HStack {
            
            Image(contact.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            Text(contact.name)
                .font(.headline)
            Spacer()
            
            // Hjerteikonet som kan toggles for å oppdatere isFavorite
            Image(systemName: contact.isFavorite ? "heart.fill" : "heart")
                .padding(10)
                .foregroundColor(.red)
                .onTapGesture {
                    contact.isFavorite.toggle() // Oppdaterer favorittstatusen
                }
        }
        
        .contentShape(Rectangle()) // Gjør hele HStack klikkbar
        .onTapGesture {
            // Åpner sheet med mer informasjon
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            // Innholdet i sheet
            ContactDetailCell(contact: $contact, contacts: $contacts, archivedContacts: $archivedContacts)
                .presentationDetents([.fraction(0.2)])
                
        }
    }
}
