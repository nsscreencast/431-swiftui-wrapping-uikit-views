import SwiftUI

struct ContentView: View {

    @State var isLoading = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 0.96, green: 0.96, blue: 0.98))


            Activity(style: .large, isAnimating: $isLoading)
                .offset(x: 0, y: -70)


            Button(action: {
                self.isLoading.toggle()
            }) {
                Text("\(self.isLoading ? "Stop" : "Start") Loading")
                    .font(.title)
                    .bold()
                    .padding()
                    .padding(.horizontal, 10)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
        }
    }
}

struct Activity : UIViewRepresentable {

    let style: UIActivityIndicatorView.Style
    @Binding var isAnimating: Bool

    init(style: UIActivityIndicatorView.Style = .medium, isAnimating: Binding<Bool>) {
        self.style = style
        self._isAnimating = isAnimating
    }

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: style)
        indicator.hidesWhenStopped = true
        return indicator
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if isAnimating {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
