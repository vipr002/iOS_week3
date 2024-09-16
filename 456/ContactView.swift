



import SwiftUI

struct ContactView: View {
    
    @Binding var contacts: [Contact] // Binding til contacts fra HomeView
    var removeFromFavorites: (Contact) -> Void // Funksjon for å flytte kontakt til favoritter
    
    var body: some View {
            
            ScrollView(.vertical) {
                
                VStack {
                    
                    ForEach(contacts.filter { !$0.isFavorite }) {
                        contact in
                        ContactCell(contact: $contacts[contacts.firstIndex(where: {$0.id == contact.id})!])
                        .onTapGesture {
                            removeFromFavorites(contact) // Flytt til favoritter
                        }
                    }
                }
            }

        .frame(maxWidth: .infinity) // Sikrer at ContactView tar opp hele bredden
    }
}
