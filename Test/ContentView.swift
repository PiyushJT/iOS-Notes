//
//  ContentView.swift
//  Test
//
//  Created by Piyush Thummar on 22/04/25.
//

import SwiftUI

struct MenuView: View {
    
    var menuItems: [MenuItem] = [
        
        MenuItem(name: "Onigiri", price: "1.99", imageName: "onigiri"),
        MenuItem(name: "Meguro Sushi", price: "5.99", imageName:"meguro-sushi"),
        MenuItem(name: "Tako Sushi", price: "4.99", imageName: "tako-sushi"),
        MenuItem(name: "Avocado Maki", price: "2.99", imageName: "avocado-maki"),
        MenuItem(name: "Tobiko Spicy Maki", price: "4.99", imageName: "tobiko-spicy-maki"),
        MenuItem(name: "Salmon Sushi", price: "4.99", imageName: "salmon-sushi"),
        MenuItem(name: "Hamachi Sushi", price: "6.99", imageName: "hamachi-sushi"),
        MenuItem(name: "Kani Sushi", price: "3.99", imageName: "kani-sushi"),
        MenuItem(name: "Tamago Sushi", price: "3.99", imageName: "tamago-sushi"),
        MenuItem(name: "California Roll", price: "3.99", imageName: "california-roll"),
        MenuItem(name: "Shrimp Sushi", price: "3.99", imageName: "shrimp-sushi"),
        MenuItem(name: "Ikura Sushi", price: "5.99", imageName: "ikura-sushi" )
        
    ]
    
    
    
    var body: some View {
        
        
        List(menuItems){ item in
            
            
            // Horizontal stack
            HStack{

                // Image
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 60)
                    .cornerRadius(20)
                    .padding(.trailing)
                
                
                // Title (name)
                Text(item.name)
                    .font(.title2)
                
                
                // Spacer
                Spacer()
                
                
                // Price on the right
                Text("$" + item.price)
                    .font(.title3)
                
                
            }
            .listRowSeparator(.hidden)
            .listRowBackground(
                Color(.brown)
                    .opacity(0.1)
            )
            
        }
        .listStyle(.plain)
    
    }
}

#Preview {
    MenuView()
}
