import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showErrorAlert = false
    @State private var showSignUpView = false
    
    var body: some View {
        ZStack {
            // Background image
            Image("logobackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all).padding(.leading, -40)
            
            VStack {
                Spacer()
                
                VStack {
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textContentType(.emailAddress)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(25)
                        .foregroundColor(.black)
                        .frame(maxWidth: 300)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(25)
                        .foregroundColor(.black)
                        .frame(maxWidth: 300)
                }
                
                Button(action: {
                    authViewModel.signIn(email: email, password: password) { success in
                        showErrorAlert = !success
                    }
                }) {
                    Text("Sign In")
                        .font(.custom("Marker Felt", size: 24))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                        .background(Color.blue)
                        .cornerRadius(15)
                }
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text("Sign In Failed"), message: Text("Please try again."))
                }
                .padding(.top, 20)
                
                Button(action: {
                    showSignUpView.toggle()
                }) {
                    Text("Don't have an account? Sign Up")
                        .font(.custom("Marker Felt", size: 18))
                        .foregroundColor(Color.black)
                }
                .sheet(isPresented: $showSignUpView) {
                    SignUpView()
                        .environmentObject(authViewModel)
                }
                .padding(.top, 10)
            }
            .padding(.bottom, 100)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(AuthViewModel())
    }
}
