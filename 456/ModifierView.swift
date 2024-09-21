//
//  ModifierView.swift
//  456
//
//  Created by Victoria Prigel on 20/09/2024.
//

import SwiftUI

struct ModifierView: View {
    
    @State private var name: String = ""
    @State private var number: String = ""
    
    var onSave: (Contact) -> Void
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("Create new Contact")
                .font(.headline)
                .padding(20)
            
            Form {
                    Text("Name:")
                    TextField(text: $name, prompt: Text("Aquired")) {
                        Text("Name")
                    }
                    Text("Number:")
                    TextField(text: $number, prompt: Text("Aquired")) {
                        Text("Number")
                }
            }
            .textFieldStyle(.roundedBorder)
            
            Spacer()
            
            Button(action: {
                // Opprette en ny kontakt og sende den tilbake via closure
                let newContact = Contact(
                    id: UUID(),
                    name: name,
                    phoneNumber: number,
                    imageName: nil,
                    isFavorite: false
                )
                onSave(newContact)  // Kalle closure for å sende kontakt tilbake
            },
            label: {
                Text("Save")
            })
            .padding(8)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(15)
        }
        
            Spacer()
    }
}
