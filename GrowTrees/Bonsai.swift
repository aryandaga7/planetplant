import SwiftUI

struct Bonsai: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    

    var body: some View {
        ZStack {
            CustomColor.someColor.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                Text("Bonsai")
                    .font(.custom("Marker Felt", size: 45))
                    .foregroundColor(CustomColor.myColor)

                Image("Bonsai2")
                    .resizable()
                    .scaledToFit().cornerRadius(20).padding(.leading, 90)

                Text("Step 1: Choose the right tree species.")
                    .font(.custom("Marker Felt", size: 25))
                    .foregroundColor(CustomColor.myColor)
                Text("Step 2: Select a suitable container.")
                    .font(.custom("Marker Felt", size: 25))
                    .foregroundColor(CustomColor.myColor)
                Text("Step 3: Prepare the soil mix.")
                    .font(.custom("Marker Felt", size: 25))
                    .foregroundColor(CustomColor.myColor)
                Text("Step 4: Plant your tree and water it.")
                    .font(.custom("Marker Felt", size: 25))
                    .foregroundColor(CustomColor.myColor)
                Text("Step 5: Prune and shape your bonsai.")
                    .font(.custom("Marker Felt", size: 25))
                    .foregroundColor(CustomColor.myColor)

                HStack {
                    Button(action: {
                        authViewModel.addCard(type: "Bonsai")
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
            .background(CustomColor.someColor)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Bonsai_Previews: PreviewProvider {
    static var previews: some View {
        Bonsai().environmentObject(AuthViewModel())
    }
}
