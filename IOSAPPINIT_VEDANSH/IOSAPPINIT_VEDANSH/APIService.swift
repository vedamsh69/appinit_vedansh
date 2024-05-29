import Foundation

class APIService: ObservableObject {
    @Published var dashboardData: DashboardModel?

    func fetchData() {
        let apiUrl = URL(string: "https://api.inopenapp.com/api/v1/dashboard")!
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "GET"
        request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCk W0ox8t bjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(DashboardModel.self, from: data)
                    DispatchQueue.main.async {
                        self.dashboardData = decodedData
                    }
                } catch {
                    print("Error decoding JSON:", error)
                }
            } else if let error = error {
                print("Error fetching data:", error)
            }
        }.resume()
    }
}
