

import SwiftUI

struct ContentView: View {
    
    
    @State var credits: Int = 0;
    
    @State var images: [String] = ["apple", "cherry", "star"];
    
    
    var body: some View {
        
        VStack {
            
            Text("The Luck Game!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            
            Spacer()
            
            
            Text("Credits: " + String(credits))
                .font(.title)
            
            
            Spacer()
            
            HStack {
                
                Image(images[0])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                                
                Image(images[1])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image(images[2])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            }
            .padding()
            
            Spacer()
            
            
            Button(action: {
                
                
                for i in 0..<3 {
                    
                    let imgNo = Int.random(in: 1...3)
                    
                    switch imgNo {
                    case 1 :
                        images[i] = "apple"
                    case 2 :
                        images[i] = "cherry"
                    default :
                        images[i] = "star"
                    }
                    
                }
                
                if(images[0] == images[1]) {
                    
                    if(images[0] == images[2]) {
                        credits += 100
                    }
                    else {
                        credits += 50
                    }
                    
                }
                
                else if(images[1] == images[2]) {
                    
                    if(images[1] == images[0]) {
                        credits += 100
                    }
                    else {
                        credits += 50
                    }
                    
                }
                
                else if(images[2] == images[0]) {
                    
                    if(images[2] == images[1]) {
                        credits += 100
                    }
                    else {
                        credits += 50
                    }
                    
                }
                
                
            }, label: {
                
                Text("Spin")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(30)
                
                
            })
            
            Spacer()
            
            
        }
        
    }
}

#Preview {
    ContentView()
}
