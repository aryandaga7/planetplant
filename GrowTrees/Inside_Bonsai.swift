import SwiftUI


//Class No need for UI
struct Inside_Bonsai: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedMenu: MenuItem? = nil
    @State private var showBonsaiInfo = false
    @State private var showPhotoFriendship = false
    
    enum MenuItem: Int, Identifiable {
        case featureComingSoon
        
        var id: Int {
            rawValue
        }
    }
    
    var body: some View {
        ZStack {
            // Add the background image
            Image("AC Background 2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { geometry in
                
                Image("Bonsai3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 500, height: 500).padding(.top, 150).padding(.leading, -38)
                
                VStack {
                    HStack {
                        
                        //Spacer()
                        
                        Button(action: {
                            selectedMenu = .featureComingSoon
                        }) {
                            Image("water drop")
                                .resizable()
                                .frame(width: 120, height: 120).padding(.top, 150).padding(.leading, 150)
                        }
                        .padding(.trailing)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            showBonsaiInfo.toggle()
                        }) {
                            Image("infosign")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white).padding(.leading, 10)
                        }
                        .padding(.leading)
                        
                        Spacer()
                        
                        Button(action: {
                            showPhotoFriendship.toggle()
                        }) {
                            Image("Camera")
                                .resizable()
                                .frame(width: 100, height: 110)
                                .foregroundColor(.white).padding(.leading, -10)
                        }
                        .padding(.trailing)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        } // Buttons glitching look into it and same with inside flower
        .alert(item: $selectedMenu) { item in
            switch item {
            case .featureComingSoon:
                return Alert(title: Text("Feature Coming Soon"),
                             message: Text(""),
                             dismissButton: .default(Text("OK")))
            }
        }
        .sheet(isPresented: $showBonsaiInfo) {
            BonsaiInfo()
        }
        .sheet(isPresented: $showPhotoFriendship) {
            PhotoFriendship()
        }
    }
}

struct Inside_Bonsai_Previews: PreviewProvider {
    static var previews: some View {
        Inside_Bonsai()
    }
}
