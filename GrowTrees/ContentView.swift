import SwiftUI
import FirebaseAuth
import FirebaseFirestore

//for cards in scroll view
struct CardView: View {
    let image: String
    let name: String
    let onRemove: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    onRemove()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                })
            }
            .padding(.trailing, 10)
            .padding(.top, 10)
            
            Image(image)
                .resizable()
                .frame(width: 150, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 2))
            
            Text(name)
                .font(.custom("Marker Felt", size: 20))
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 250)
    }
}

class ContentViewData: ObservableObject {
    @Published var cards: [String] = []
    
    func addSunflowerCard() {
        cards.append("Sunflower")
    }
}

// The code for screen display
struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showTreeListing = false
    @State private var showInsideFlower = false
    @State private var showInsideBonsai = false
    
    var body: some View {
        NavigationView {
            ZStack {
                /*LinearGradient(gradient: Gradient(colors: [.teal, .secondary]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all) */
                
                Image("AC Background 2").resizable().edgesIgnoringSafeArea(.all).opacity(0.95)
                                
                VStack {
                                    HStack {
                                        Image("Profile pic 2")
                                            .resizable()
                                            .frame(width: 120, height: 120)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                        
                                        Text(authViewModel.username)
                                            .font(.custom("Marker Felt", size: 40))
                                            .foregroundColor(Color.white)

                                    }
                                    .padding(.top, 20)
                                    .padding(.horizontal)
                    
                    Divider()
                        .background(Color.white)
                        .frame(height: 1)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                    
                    Text("Your Buds")
                        .font(.custom("Marker Felt", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.brown)
                        .padding(.bottom, 10)
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 20)], spacing: 20) {
                            ForEach(authViewModel.cards, id: \.self) { card in
                                CardView(image: card, name: card, onRemove: {
                                    authViewModel.cards.removeAll(where: { $0 == card })
                                    if let userId = authViewModel.user?.uid {
                                        authViewModel.saveCards(userId: userId, cards: authViewModel.cards)
                                    }
                                }).onTapGesture {
                                    if card == "Sunflower" {
                                        showInsideFlower.toggle()
                                    } else if card == "Bonsai" {
                                        showInsideBonsai.toggle()
                                    }
                                } .background(
                                    Group {
                                        if card == "Sunflower" {
                                            NavigationLink("", destination: Inside_Flower(), isActive: $showInsideFlower)
                                                .opacity(0)

                                        } else if card == "Bonsai" {
                                            NavigationLink("", destination: Inside_Bonsai(), isActive: $showInsideBonsai)
                                                .opacity(0)
                                        }
                                    }
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        showTreeListing.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Circle().fill(Color.black))
                    })
                    .padding(.bottom, 20)
                }
            }
            .sheet(isPresented: $showTreeListing) {
                Tree_Listing().environmentObject(authViewModel)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        authViewModel.signOut()
                    }) {
                        Text("Logout")
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}

