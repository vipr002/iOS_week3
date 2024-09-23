//
//  ArchivedCell.swift
//  456
//
//  Created by Victoria Prigel on 18/09/2024.
//

import Foundation
import SwiftUI


struct ArchivedCell: View {

    @Binding var contact: Contact
    @Binding var archivedContact: ArchivedContact

    var body: some View {
        
        VStack {
            
            HStack {
                
                ProfileImageView(contact: $contact)

                Text(contact.name)
            }
            
            Text("Archived at: \(ArchivedList.formatDate(archivedContact.archivedAt))")
        }
        .background(Color.white)
    }
}
