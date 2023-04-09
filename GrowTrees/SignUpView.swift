import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var username = ""
    @State private var showErrorAlert = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""

    var body: some View {
        ZStack {
            // Set the background image
            Image("logobackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all).padding(.leading, -40)
            
            // Add username saving feature coz previous realtime change of username doesn't work. So add username direct to fb
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

                    TextField("Username", text: $username)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textContentType(.username)
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
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(25)
                        .foregroundColor(.black)
                        .frame(maxWidth: 300)
                }
                
                Button(action: {
                    if password != confirmPassword {
                        errorTitle = "Sign Up Failed"
                        errorMessage = "Passwords do not match."
                        showErrorAlert = true
                    } else {
                        authViewModel.signUp(email: email, password: password, username: username) { success in
                            if success {
                                presentationMode.wrappedValue.dismiss()
                            } else {
                                errorTitle = "Sign Up Failed"
                                errorMessage = "Please try again."
                                showErrorAlert = true
                            }
                        }
                    }
                })
                {
                    Text("Sign Up")
                        .font(.custom("Marker Felt", size: 24))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                        .background(Color.blue)
                        .cornerRadius(15)
                }
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text(errorTitle), message: Text(errorMessage))
                }
                .padding(.top, 20)
            }
            .padding(.bottom)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(AuthViewModel())
    }
}
