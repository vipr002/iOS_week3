//
//  ProfileImageView.swift
//  456
//
//  Created by Victoria Prigel on 21/09/2024.
//

import SwiftUI

struct ProfileImageView: View {
    
    @Binding var contact : Contact
    
    var body: some View {
        
        if let imageName = contact.imageName {
                Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.leading, 20)
                .padding(.trailing, 10)
            }
        
        else {
            
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .foregroundColor(.white) 
                .background(Color.gray)
                .clipShape(Circle())
                .padding(.leading, 20)
                .padding(.trailing, 10)
        }
    }
}
