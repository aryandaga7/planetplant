import SwiftUI

struct PhotoFriendship: View {
    var body: some View {
        Image("Photo friendship")
            .resizable()
            .scaledToFit()
    }
}

struct PhotoFriendship_Previews: PreviewProvider {
    static var previews: some View {
        PhotoFriendship()
    }
}
