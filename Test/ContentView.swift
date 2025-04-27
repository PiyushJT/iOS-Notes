/*

 Build a UI with a List and a Button below it.

 Declare a property that contains an array of 5 strings. These can be any 5 words you want.
 
 Each time the button is tapped, choose a random word from the array and put it in the list.

 The number of items in the list should grow as you tap the button.
 
*/



import SwiftUI

struct MenuView: View {
    
    @State var items: [Int] = []
    
    var body: some View {
        
        List(items, id: \.self) { item in
            
            Text("\(item)")
            
        }
        
        Button{
            
            items.append(items.count + 1)
            
        } label: {
            Text("Add")
        }
        
    }
}

#Preview {
    MenuView()
}
