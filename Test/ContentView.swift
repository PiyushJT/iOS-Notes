import SwiftUI

struct ContentView: View {
    
    let images = ["apple", "dog", "egg"]
    
    @State private var imageInd = 0
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    @State private var difficulty = Difficulties.easy

    @State private var score = 0
    
    enum Difficulties: Double {
        case easy = 1
        case medium = 0.5
        case hard = 0.2
    }
    
    
    
    var body: some View {
        
        VStack{
            
            
            HStack {
                
                Menu("Difficulty: \(difficulty)") {
                    
                    Button("Easy") {
                        updateDiff(diff: Difficulties.easy)
                    }
                    
                    Button("Medium") {
                        updateDiff(diff: Difficulties.medium)
                    }
                    
                    Button("Hard") {
                        updateDiff(diff: Difficulties.hard)
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
    
    func updateDiff(diff: Difficulties) {
        
        difficulty = diff
        
        timer = Timer.publish(every: diff.rawValue, on: .main, in: .common)
            .autoconnect()
    }

}



#Preview {
    ContentView()
}
