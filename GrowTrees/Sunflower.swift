import SwiftUI

struct CustomColor {
    static let myColor = Color("brown")
    static let green = Color("green")
    static let someColor = Color("pink")
    // Add more here...
}

// Do the firebase thing in here to add card in both sunflower and bonsai.

//I'm calling method for AuthView check it out when free. Not workign
struct Sunflower: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                Text("Sunflower")
                    .font(.custom("Marker Felt", size: 45))
                    .foregroundColor(CustomColor.myColor)

                Image("Sunflower3")
                    .resizable()
                    .scaledToFit().cornerRadius(20).padding(.leading, 90)

                Text("Step 1: Choose a sunny spot.")
                    .font(.custom("Marker Felt", size: 25))
                    .foregroundColor(CustomColor.myColor)
                Text("Step 2: Plant seeds about 1 inch deep.")
                    .font(.custom("Marker Felt", size: 25))
                    .foregroundColor(CustomColor.myColor)
                Text("Step 3: Water the seeds gently.")
                    .font(.custom("Marker Felt", size: 25))
                    .foregroundColor(CustomColor.myColor)
                Text("Step 4: Keep the soil moist.")
                    .font(.custom("Marker Felt", size: 25))
                    .foregroundColor(CustomColor.myColor)
                Text("Step 5: Watch your sunflower grow!")
                    .font(.custom("Marker Felt", size: 25))
                    .foregroundColor(CustomColor.myColor)

                HStack {
                    Button(action: {
                        authViewModel.addCard(type: "Sunflower")
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Add to Cards")
                            .font(.custom("Marker Felt", size: 20))
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10).bold()
                    }

                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                            .font(.custom("Marker Felt", size: 20))
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10).bold()
                    }
                }.padding(.leading, 30)
            }
            .padding()
            .navigationBarTitle("", displayMode: .inline)
            .background(Color.yellow)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Sunflower_Previews: PreviewProvider {
    static var previews: some View {
        Sunflower().environmentObject(AuthViewModel())
    }
}
