import SwiftUI

struct Tree_Listing: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Text("Choose Your Bud")
                    .font(.custom("Marker Felt", size: 40))
                    .foregroundColor(Color.white)
                    .padding()

                ScrollView {
                    VStack {
                        NavigationLink(destination: Sunflower()) {
                            HStack {
                                Text("Sunflower")
                                    .font(.custom("Marker Felt", size: 24))
                                    .foregroundColor(Color.white) // Add this line
                                Image("Sunflower")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .padding()
                            .background(Color.yellow.opacity(0.2)) 
                            .cornerRadius(10)
                        }

                        NavigationLink(destination: Bonsai()) {
                            HStack {
                                Text("Bonsai")
                                    .font(.custom("Marker Felt", size: 24))
                                    .foregroundColor(Color.white)
                                Image("Bonsai")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .padding()
                            .background(Color.green.opacity(0.2)) // Update this line
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .background( // Add this block
                Image("Green back")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct Tree_Listing_Previews: PreviewProvider {
    static var previews: some View {
        Tree_Listing().environmentObject(ContentViewData())
    }
}
