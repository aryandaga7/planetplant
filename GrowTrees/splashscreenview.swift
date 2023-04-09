import SwiftUI

// after main it goes here (Aryan add look into if sign in or content screen)

struct SplashScreenView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var isActive = false

   
    var body: some View {
        Group {
            if authViewModel.user == nil {
                if isActive {
                    SignInView()
                } else {
                    GIFLoadingView(isActive: $isActive)
                }
            } else if isActive {
                ContentView()
            } else {
                GIFLoadingView(isActive: $isActive)
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView().environmentObject(AuthViewModel())
    }
}
