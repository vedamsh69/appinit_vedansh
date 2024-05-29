import SwiftUI
import Charts

struct ContentView: View {
    @StateObject var apiService = APIService()
    @State private var selectedTab = 0

    var body: some View {
        NavigationView {
            VStack {
                if let data = apiService.dashboardData {
                    Text(data.greeting)
                    ChartView(chartData: data.chartData)
                        .frame(height: 200)
                    Picker("", selection: $selectedTab) {
                        Text("Top Links").tag(0)
                        Text("Recent Links").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    LinkListView(links: selectedTab == 0 ? data.topLinks : data.recentLinks)
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Dashboard")
            .onAppear {
                apiService.fetchData()
            }
        }
    }
}
