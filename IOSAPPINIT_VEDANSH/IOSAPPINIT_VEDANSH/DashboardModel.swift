import Foundation
import DGCharts
import Charts

struct DashboardModel: Codable, Identifiable {
    var id = UUID()
    let greeting: String
    let chartData: [ChartDataPoint]
    let topLinks: [LinkItem]
    let recentLinks: [LinkItem]
}

struct ChartDataPoint: Identifiable, Codable {
    var id = UUID()
    let xValue: String
    let yValue: Double

    func toChartDataEntry() -> ChartDataEntry {
        return ChartDataEntry(x: Double(xValue) ?? 0.0, y: yValue)
    }
}

struct LinkItem: Identifiable, Codable {
    var id = UUID()
    let title: String
    let url: String
}
