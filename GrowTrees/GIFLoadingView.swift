import SwiftUI

struct GIFLoadingView: View {
    @Binding var isActive: Bool
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        VStack {
            GifImage(name: "tree")
        }
        .padding(.top, 200)
        .scaleEffect(size)
        .opacity(opacity)
        .onAppear {
            withAnimation(.easeIn(duration: 1.2)) {
                self.size = 0.9
                self.opacity = 1.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct GIFLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        GIFLoadingView(isActive: .constant(false))
    }
}
