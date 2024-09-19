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
        }
        .padding()
    }
}
