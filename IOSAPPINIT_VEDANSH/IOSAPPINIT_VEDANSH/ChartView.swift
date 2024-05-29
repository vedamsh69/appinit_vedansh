import SwiftUI
import DGCharts
import Charts
import SwiftUI
import Charts

struct ChartView: UIViewRepresentable {
    var chartData: [ChartDataPoint]

    func makeUIView(context: Context) -> BarChartView {
        let chartView = BarChartView()
        chartView.data = addData()
        return chartView
    }

    func updateUIView(_ uiView: BarChartView, context: Context) {
        uiView.data = addData()
    }

    func addData() -> BarChartData {
        let dataEntries = chartData.map {
            BarChartDataEntry(x: Double($0.xValue) ?? 0.0, y: $0.yValue)
        }
        let dataSet = BarChartDataSet(entries: dataEntries, label: "Chart Data")
        return BarChartData(dataSet: dataSet)
    }
}
