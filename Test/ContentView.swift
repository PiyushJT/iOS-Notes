//
//  ContentView.swift
//  Test
//
//  Created by Piyush Thummar on 22/04/25.
//

import SwiftUI


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}


struct ContentView: View {
    
    @State var n  = 0
    
    var body: some View {
        
        
        ZStack{
            
            Color(hex: "FFC200")
                .ignoresSafeArea()

            
            VStack(
                alignment: .leading,
                spacing: 10
            ) {
                
                Image("naut")
                    .resizable()
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
                
                
                Text("Astronaut")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                
                
                Text("I am stuck here. Please help")
                    .font(.title3)
                    .foregroundColor(.black)
                    .padding(.leading)
                
                
                VStack{
                    
                    HStack{
                        
                        Spacer()
                        
                        Text("\(n) Persons Donated")
                            .font(.title3)
                            .foregroundColor(.blue)
                            .padding(.trailing)
                        
                    }
                    .padding(.top)
                    
                    HStack{
                        
                        Spacer()
                        
                        Button {
                            n += 1
                            print(n)
                        }
                        label: {
                            Text("Donate")
                        }
                        .padding(.trailing)
                        .foregroundColor(.orange)
                        .font(.title2)
                        .fontWeight(.bold)
                        
                    }
                }
                
                

            }
            .padding(20)
            .background(.white)
            .cornerRadius(20)
            .shadow(radius: 20)
            .padding(.horizontal, 20)
            
            
        }
        
        
    }
    
}

#Preview {
    ContentView()
}
