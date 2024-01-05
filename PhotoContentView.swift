import SwiftUI

struct ContentView: View {
    let photos = ["photo1", "photo2", "photo3"] // Add your image names here

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(photos, id: \.self) { photo in
                        NavigationLink(destination: PhotoDetail(photo: photo)) {
                            Image(photo)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Photo Gallery")
        }
    }
}

struct PhotoDetail: View {
    let photo: String

    var body: some View {
        VStack {
            Image(photo)
                .resizable()
                .scaledToFit()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            // Implement any additional actions upon back button tap
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.blue)
                        }
                    }
                }
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
