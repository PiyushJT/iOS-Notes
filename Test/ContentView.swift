import SwiftUI

struct ContentView: View {
    

    
    var body: some View {
        VStack{
            
            headNavigator()
            
            profileStatsTop()
            
            profileStatsBio()
            
            buttons()
            
            Posts()
            
            Spacer()
            
            
        }
    }

}

struct headNavigator: View {
    var body: some View {
        
        HStack{
            
            
            HStack{
                Image(systemName: "arrow.backward")
                
                
                Text("Piyush_JT__")
                    .padding(.leading)
            
            }
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .rotationEffect(Angle(degrees: 90))
            
        }
        .padding()
        .font(.headline)
        
    }
}


struct profileStatsTop: View {
    var body: some View {
        
        HStack{
            
            Image("profile")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            Spacer()
            
            VStack{
                Text("4")
                    .font(.title2)
                Text("Posts")
            }
            Spacer()
            
            VStack{
                Text("20M")
                    .font(.title2)
                Text("Followers")
            }
            Spacer()
            
            VStack{
                Text("69")
                    .font(.title2)
                Text("Following")
            }
            
        }
        .padding(.top)
        .padding(.horizontal)
        
    }
}

struct profileStatsBio: View {
    
    var body: some View {
        
        HStack{
            VStack (alignment: .leading) {
                
                Text("Piyush Thummar")
                    .fontWeight(.bold)
                
                Text("૩૦-૭")
                Text("Patel 🕉️")
                Text("App Dev.")
                
                Text("See Translation")
                    .fontWeight(.bold)

                HStack{
                    
                    Image(systemName: "link")
                    
                    Text("play.googl.com/store/apps/details?id=com.piyus")
                    
                }
                .foregroundColor(.blue)
                .font(.subheadline)
                
            }
            .padding()
         
            Spacer()
        }
        
    }
}


struct buttons : View {
    
    var body: some View {
        
        HStack{
            
            Button(action: {}) {
                Text("Follow")
                    .frame(maxWidth: .infinity, maxHeight: 5)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            Button(action: {}) {
                Text("Message")
                    .frame(maxWidth: .infinity, maxHeight: 5)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            
        }
        .padding(.horizontal)
        
    }
    
}


struct Posts : View {
    
    var body: some View {
        
        
        VStack {
            
            HStack{
                
                Spacer()
                
                VStack{
                    
                    Image(systemName: "rectangle.grid.3x3.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Rectangle()
                        .frame(width: 50, height: 3)
                    
                }
                
                Spacer()
                Spacer()
                
                VStack{
                    
                    Image(systemName: "person.crop.square")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                }
                
                Spacer()
                
            }
        }
        .padding(.top)
        .padding(.horizontal)
        
        
        let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        
        let imageNames = ["photo1", "photo2", "photo3", "photo4"]

        
        LazyVGrid(columns: columns, spacing: 10) {
            
            ForEach(imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .cornerRadius(8)
            }
            
        }
        .padding(.horizontal)
        
        
    }
}



#Preview {
    ContentView()
}
