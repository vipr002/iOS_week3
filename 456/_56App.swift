//
//  _56App.swift
//  456
//
//  Created by Victoria Prigel on 13/09/2024.
//

import SwiftUI

@main
struct _56App: App {
       
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// TO DO:
// We now want to modify the app such that we start with an empty list of contact. But are able to add and delete contacts, who will be persisted between app launches
// On the contacts list tab, add a button in the top navigation toolbar. x
// This button should modally present (ie, from the bottom) a new screen that will be a minimalistic form to input new contacts. Use `sheet` for this.
// The form will have two textfields: one for the name (or two if you split it between first & last name), one for the phone number. This, plus a save button (and eventually a cancel button)
//Upon adding a new contact, it should be persisted. You can introduce a ContactsRepository to do so, which would be informed after any modification to the contact list, to save it to storage.
