import SwiftUI

struct BonsaiInfo: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24.0) {
                Text("Talkie Time:")
                    .font(.custom("Marker Felt", size: 45))

                // Add bonsai information here
                Text("Who Am I")
                    .font(.custom("Marker Felt", size: 40))

                Text("Hello! I am a tiny tree, but I'm not just any ordinary tree, I am a bonsai! Bonsai is a Japanese art form where trees are grown in small pots and carefully shaped to look like miniature trees. I am like a tiny tree that you can hold in your hand! Bonsai trees require a lot of patience and care. My branches and leaves are carefully trimmed and shaped by a bonsai artist to create a unique and beautiful tree shape. Some bonsai trees are even hundreds of years old! Did you know that \"bon\" means \"tray\" and \"sai\" means \"planting\" in Japanese? Bonsai trees come in many different types, including pine, maple, and juniper. Bonsai trees can live for a long time with proper care and can be passed down from one generation to the next, just like a family treasure. I am a tiny tree with a big history, and I bring joy and beauty to those who appreciate the art of bonsai!")
                    .font(.custom("Marker Felt", size: 20))

                Text("Fun Facts About Us")
                    .font(.custom("Marker Felt", size: 40))

                Text("1. Bonsai trees can live for a very long time with proper care. Some bonsai trees are known to be hundreds of years old and are considered valuable living art pieces.")
                    .font(.custom("Marker Felt", size: 20))

                Text("2. Bonsai trees come in many different styles and sizes. Some common styles include formal upright, informal upright, slanting, cascade, and windswept, among others.")
                    .font(.custom("Marker Felt", size: 20))

                Text("3. Bonsai trees are often used as symbols of harmony, balance, and patience. They are considered a form of living art that reflects the beauty and serenity of nature.")
                    .font(.custom("Marker Felt", size: 20))
            }
            .padding()
        }
        .background(
            Image("blue clouds")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct BonsaiInfo_Previews: PreviewProvider {
    static var previews: some View {
        BonsaiInfo()
    }
}
