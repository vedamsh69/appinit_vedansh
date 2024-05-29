import SwiftUI
import WebKit

struct LinkListView: View {
    let links: [LinkItem]

    var body: some View {
        NavigationStack {
            List {
                ForEach(links) { link in
                    NavigationLink(value: link) {
                        VStack(alignment: .leading) {
                            Text(link.title)
                            Text(link.url)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationDestination(for: LinkItem.self) { link in
                WebView(url: URL(string: link.url)!)
            }
            .navigationTitle("Links")
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: url))
    }
}
