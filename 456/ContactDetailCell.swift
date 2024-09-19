//
//  ContactDetailCell.swift
//  456
//
//  Created by Victoria Prigel on 15/09/2024.
//

import SwiftUI

struct ContactDetailCell: View {
    
    @Binding var contact: Contact
    @Binding var contacts: [Contact]
    @Binding var archivedContacts: [ArchivedContact]
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Image(contact.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                
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
                    .padding(.trailing, 20)
            }
            
            // Hvis kontakten er arkivert, vis dato
            if contact.isArchived {
                if let archivedAt = contact.archivedAt {
                    Text("Archived at: \(ArchivedList.formatDate(archivedAt))")
                        .font(.footnote)
                }
            }


            HStack {
                
                Spacer()
                
                // --- Call button
                
                Button(action: {
                    print("Phone button tapped")
                },
                       label: {
                    Image(systemName: "phone.fill")
                    Text("Call")
                })
                .padding(8)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(15)
                
                Spacer()
                
                // --- Message button
                
                Button(action: {
                    print("Message button tapped")
                },
                       label: {
                    Image(systemName: "message.fill")
                    Text("Message")
                })
                .padding(8)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(15)
                
                Spacer()
                                
                // --- Archive button
                
                Button(action: {
                    archiveContact(contact: &contact) // Arkiver contact
                    archive(contact) // Fjern fra contacts og legg til i arkiv
                }) {
                    Text("Archive")
                        .foregroundColor(.blue)
                }
                .padding(8)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(15)
                
                Spacer()
            }
        }
        
        .frame(maxWidth: .infinity)
        .padding(5)
        .padding(.bottom)
        
        // ramme rundt
        /*.overlay(
            RoundedRectangle(cornerRadius: 15)
        ) */
    }
    
    // ---- Arkiver contact
    private func archive(_ contact: Contact) {
        let archivedContact = ArchivedContact(contact: contact, archivedAt: Date())
        archivedContacts.append(archivedContact)
        
        // ---- Fjern fra contacts
        if let foundIndex = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts.remove(at: foundIndex)
        }
    }
}
