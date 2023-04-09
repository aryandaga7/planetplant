import SwiftUI

struct SunflowerInfo: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24.0) {
                Text("Talkie Time")
                    .font(.custom("Marker Felt", size:40))

                // Add sunflower information here
                Text("Hi there! I am a happy and bright sunflower, reaching towards the sky with my tall stem and big yellow petals. I love soaking up the warm sunshine every day, it makes me grow big and strong. Did you know that I am called a sunflower because my face always faces towards the sun? I follow the sun from morning until evening, it's like playing hide and seek with the sun! And guess what? I am not just a pretty flower, I am also useful. My seeds are packed with yummy and healthy oils that can be used to make tasty snacks like sunflower seeds or even oil for cooking! Animals like birds and squirrels also love to snack on my seeds. I am a cheerful flower that brightens up any garden or field, and I bring joy to everyone who sees me!")
                    .font(.custom("Marker Felt", size: 20))

                Text("Fun Facts About Us")
                    .font(.custom("Marker Felt", size:40))

                Text("1. Sunflowers can grow really tall! Some varieties of sunflowers can reach heights of up to 12 feet or more. That's taller than some basketball hoops!")
                    .font(.custom("Marker Felt", size:20))

                Text("2. Sunflowers are not just yellow. While yellow is the most common color for sunflowers, they can also come in other colors such as red, orange, burgundy, and even bi-colored varieties.")
                    .font(.custom("Marker Felt", size:20))

                Text("3. Sunflowers are often used to measure time. In addition to following the sun during the day, young sunflower buds have been used as a natural timekeeper. The buds droop down in the evening and then straighten up again in the morning, helping people tell the time without a clock!")
                    .font(.custom("Marker Felt", size:20))
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

struct SunflowerInfo_Previews: PreviewProvider {
    static var previews: some View {
        SunflowerInfo()
    }
}
