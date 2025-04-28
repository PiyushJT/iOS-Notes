

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        ZStack {
            
            
            Image("toronto")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(20)
                .border(.blue, width: 2)
            
            
            VStack {
                
                Text("CN Tower")
                    .font(.largeTitle)
                
                Text("Toronto")
                    .font(.headline)
                
            }
            .padding()
            .foregroundColor(.white)
            .background(.black.opacity(0.85))
            
        }
        
    }
}

#Preview {
    ContentView()
}
