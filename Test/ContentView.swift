import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    VStack{
                        
                        Spacer()
                        
                        Image("orange")
                            .resizable()
                            .frame(width: 150, height: 150)
                        
                        Spacer()
                        
                        HStack (alignment: .bottom) {
                            InsideLetter(letter: "O")
                            InsideLetter(letter: "")
                            InsideLetter(letter: "")
                            InsideLetter(letter: "")
                            InsideLetter(letter: "")
                            InsideLetter(letter: "")
                        }
                        .frame(height: 30)
                        
                        Spacer()
                        
                    }
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.width * 0.9)
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray, lineWidth: 1.5)
                    }
                    
                    Text("Score: 0")
                        .font(.title2)
                        .foregroundStyle(Color.white)
                        .padding(.top)
                    
                    HStack {
                        
                        LetterBox(letter: "R")
                        LetterBox(letter: "A")
                        LetterBox(letter: "N")
                        LetterBox(letter: "O")
                        LetterBox(letter: "G")
                        LetterBox(letter: "E")
                        
                    }
                    
                }
                
                
            }
            
        }
    }



}


struct LetterBox: View {
    
    let letter: String
    
    var body: some View {
        
        ZStack {
            
            Text(letter)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .frame(width: 30, height: 30)
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
    }
}


struct InsideLetter: View {
    
    var letter: String
    
    var body: some View {
        
        
        VStack {
        
            LetterBox(letter: letter)
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 30, height: 2)
                .padding(.top, 5.0)
        
        }
        
    }
    
}



#Preview {
    ContentView()
}
