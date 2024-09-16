//
//  ContactDetailCell.swift
//  456
//
//  Created by Victoria Prigel on 15/09/2024.
//

import SwiftUI

struct ContactDetailCell: View {
    
    @Binding var contact: Contact
    
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
                    Text("Archived at: \(formatDate(archivedAt))")
                        .font(.footnote)
                }
            }

            HStack {
                
                Spacer()
                
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
                                
                Button(action: {
                    print("Archive button tapped")
                },
                       label: {
                    Image(systemName: "person.fill")
                    Text("Arhive")
                })
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
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
}

#Preview {
    ContactDetailCell(contact: .constant(Contact(name: "John Doe", imageName: "person1", isFavorite: false, isArchived: true, archivedAt: Date())))
}
