//
//  ArchivedCell.swift
//  456
//
//  Created by Victoria Prigel on 18/09/2024.
//

import Foundation
import SwiftUI


struct ArchivedCell: View {

    var contact: Contact
    @Binding var archivedContact: ArchivedContact

    var body: some View {
        
        VStack {
            
            HStack {
                Image(contact.imageName ?? "defaultImage")  // Bruk en standard "defaultImage" hvis imageName er nil
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

                Text(contact.name)
            }
            
            Text("Archived at: \(ArchivedList.formatDate(archivedContact.archivedAt))")
        }
        .background(Color.white)
    }
}
