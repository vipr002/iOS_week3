//
//  ContactDetailsView.swift
//  456
//
//  Created by Victoria Prigel on 14/09/2024.
//

import SwiftUI

struct ContactDetailsView: View {
    
    @Binding var contact: Contact // Bruker binding for å kunne oppdatere kontaktens egenskaper
    
    var body: some View {
        VStack(alignment: .leading) {
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
                        contact.isFavorite.toggle() // Toggler verdien av isFavorite
                    }
            }
            
            /*
            // Viser arkiveringsdato hvis tilgjengelig
            if let archivedAt = contact.archivedAt {
                Text("Archived at: \(archivedAtFormatted)")
                    .font(.caption)
                    .padding(.top, 5)
            }
             */
        }
        .padding()
    }
    
    // Formaterer archivedAt som en lesbar dato
    var archivedAtFormatted: String {
        if let archivedAt = contact.archivedAt {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter.string(from: archivedAt)
        } else {
            return "Not archived"
        }
    }
}
    
