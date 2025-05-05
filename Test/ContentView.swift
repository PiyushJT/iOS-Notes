

import SwiftUI

struct ContentView: View {
    

    @State var score = 0
    @State var attempt = 0

    
    var body: some View {
        
        VStack {
            
            Text("The Guess Game!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            Text("Attempts left : \(5-attempt)")
                .font(.title)
    
            
            Spacer()
            
            HStack {
                Spacer()
                
                
                Button {
                    checkAnswer(answer: 0)
                }
                label: {
                    Image("cat")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(15)
                        .background(.primary)
                        .cornerRadius(10)
                }
                
                
                Spacer()
                
                
                Button {
                    checkAnswer(answer: 1)
                }
                label: {
                    Image("dog")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(15)
                        .background(.primary)
                        .cornerRadius(10)
                }
                
                
                Spacer()
                
                
                Button {
                    checkAnswer(answer: 2)
                }
                label: {
                    Image("fox")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(15)
                        .background(.primary)
                        .cornerRadius(10)
                }
                
                
                Spacer()
            
            }
            
            Spacer()
            
            Text("Score: " + String(score))
                .font(.title)
                .padding(.bottom, 100)
            
        }
        
    }
    
    func checkAnswer(answer: Int) {
        
        
        if(attempt < 5){
            
            let rand = Int.random(in: 0...2)
            
            if(rand == answer){
                score += 1
            }
            
            attempt += 1
        }
        else {
            attempt = 0;
            score = 0;
        }
            
    }
    
}

#Preview {
    ContentView()
}
