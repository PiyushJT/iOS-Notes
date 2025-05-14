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
            
                ButtonView(score: $score, attempt: $attempt, imageNo: 0)
                
                Spacer()
                
                ButtonView(score: $score, attempt: $attempt, imageNo: 1)
                
                Spacer()
                
                ButtonView(score: $score, attempt: $attempt, imageNo: 2)
                
                Spacer()
            
            }
            
            Spacer()
            
            Text("Score: " + String(score))
                .font(.title)
                .padding(.bottom, 100)
            
        }
        
    }
    
    
    
    struct ButtonView: View {
        
        @Binding var score: Int
        @Binding var attempt: Int
        var imageNo: Int
        
        var body: some View {
            
            
            let image = switch imageNo {
                
            case 0:
                "cat"
            case 1:
                "dog"
            default:
                "fox"
                
            }
            
            
            Button(
                action: {
                    checkAnswer(answer: imageNo)
                },
                
                label: {
                    Image(image)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(15)
                        .background(.lime)
                        .cornerRadius(10)
                }
            )

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

}


#Preview {
    ContentView()
}
