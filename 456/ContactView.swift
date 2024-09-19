



import SwiftUI

struct ContactView: View {
    
    @Binding var contacts: [Contact]
    @Binding var archivedContacts: [ArchivedContact]
    
    var removeFromFavorites: (Contact) -> Void
    var searchedText: String
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                // Filtreringslogikk direkte i contactview
                ForEach(filteredContacts) { contact in
                    if let contactIndex = contacts.firstIndex(where: { $0.id == contact.id }) {
                        
                        
                        // Sende både kontakter og spesifikk kontakt som binding til contactcell
                        ContactCell(contacts: $contacts, contact: $contacts[contactIndex], archivedContacts: $archivedContacts)
                            .onTapGesture {
                                removeFromFavorites(contact)
                            }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    // Viser vanlige kontakter
    var filteredContacts: [Contact] {
        return contacts.filter { contact in
            !contact.isFavorite && !contact.isArchived &&
            (searchedText.isEmpty || contact.name.lowercased().contains(searchedText.lowercased()))
        }
    }
}


/*
import SwiftUI

struct ContactView: View {
    
    @Binding var contacts: [Contact] // Binding til contacts fra HomeView
    @Binding var archivedContacts: [ArchivedContact]
    
    var removeFromFavorites: (Contact) -> Void // Funksjon for å flytte kontakt til favoritter
    var searchedText: String
    
    var body: some View {
            
            ScrollView(.vertical) {
                
                VStack {
                    
                    ForEach(contacts.filter { !$0.isFavorite }) { contact in
                        if let contactIndex = contacts.firstIndex(where: { $0.id == contact.id }) {
                            ContactCell(contacts: $contacts, contact: $contacts[contactIndex], archivedContacts: $archivedContacts)
                            .onTapGesture {
                                removeFromFavorites(contact) // Flytt til favoritter
                            }
                        }
                    }
                }
            }
        .frame(maxWidth: .infinity) // ContactView tar opp hele bredden
    }
}
*/
