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
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("Create new Contact")
            
            Form {
                TextField(text: $name, prompt: Text("Name")) {
                    Text("Name")
                }
                TextField(text: $number, prompt: Text("Number")) {
                    Text("Number")
                }
            }
            .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    ModifierView()
}
