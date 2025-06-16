import SwiftUI

struct ContentView: View {
    
    let images = ["apple", "dog", "egg"]
    
    @State private var imageInd = 0
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    @State private var difficulty = 1.0

    @State private var score = 0
    
    
    
    var body: some View {
        
        VStack{
            
            
            HStack {
                
                Menu("Difficulty: \(getDiff(diffF: difficulty))") {
                    
                    Button("Easy") {
                        updateDiff(diff: 1)
                    }
                    
                    Button("Medium") {
                        updateDiff(diff: 0.5)
                    }
                    
                    Button("Hard") {
                        updateDiff(diff: 0.2)
                    }
                    
                }
                .font(.title2)
                
                
                Spacer()
                
                
                Text("Score: \(score)")
                    .font(.title2)

            }
            .padding(.top, 100)
            .padding(.horizontal)
            
            
            Spacer()
            
            Image(images[imageInd])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .shadow(radius: 3)
            
            Spacer()
            
        }
        .onReceive(timer, perform: { _ in
            
            changeImage()
            
        })
    }

    

    
    func changeImage() {
        
        // circular increment
        imageInd = (imageInd + 1) % images.count
        
    }
    
    func getDiff(diffF: Double) -> String {
        
        switch diffF {
            
        case 1:
            return "Easy"
        case 0.5:
            return "Medium"
        case 0.2:
            return "Hard"
        default:
            return ""
            
        }
        
    }
    
    func updateDiff(diff: Double) {
        
        difficulty = diff
        
        timer = Timer.publish(every: diff, on: .main, in: .common)
            .autoconnect()
    }

}



#Preview {
    ContentView()
}
