import SwiftUI

struct ContentView: View {
    
    let images = ["apple", "dog", "egg"]
    
    enum Difficulties: Double {
        case easy = 1
        case medium = 0.5
        case hard = 0.2
    }
    
    @State private var imageInd = 0
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    @State private var difficulty = Difficulties.easy

    @State private var score = 0
    
    @State private var imgToTap = Int.random(in: 0...2)
    
    @State private var isGameOver = false
    
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
            .padding(.top, 50)
            .padding(.horizontal)
            
            
            Spacer()
            
            
            if (isGameOver) {
                Text("Game over with score \(score)")
                    .font(.title)
            }
            else {
                Text("Tap on \(images[imgToTap].capitalized)")
                    .font(.title)
            }
            
            Spacer()
            
            Image(images[imageInd])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .shadow(radius: 3)
                .onTapGesture {
                    checkResult(imgInd: imageInd)
                }
            
            Spacer()
            
            Button {
                reset()
            } label: {
                
                Text("Reset Game")
                
            }

            
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
        
        reset()
        
    }
    
    func checkResult(imgInd: Int) {
        
        if (imgInd == imgToTap) {
            score += 1
        }
        else {
            
            isGameOver = true
            timer.upstream.connect().cancel()
            
        }
        
    }
    
    func reset() {
        
        score = 0
        imageInd = 0
        imgToTap = Int.random(in: 0 ... 2)
        isGameOver = false
        
        timer = Timer.publish(every: difficulty.rawValue, on: .main, in: .common)
            .autoconnect()
        
    }

}



#Preview {
    ContentView()
}
