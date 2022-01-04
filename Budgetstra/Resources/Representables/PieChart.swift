//
//  PieChart.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2022-01-03.
//

import SwiftUI
import Charts

struct PieChart : UIViewRepresentable{
   
    
    let entry : [PieChartDataEntry]
    let pieChart = PieChartView()
    
    func makeUIView(context: Context) -> PieChartView {
        pieChart.delegate = context.coordinator
        
        return pieChart
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
        let dataSet = PieChartDataSet(entries: entry)
        let pieChartData = PieChartData(dataSet: dataSet)
        dataSet.colors = ChartColorTemplates.joyful()
        uiView.data = pieChartData
        configureChart(uiView)
        formatCenter(uiView)
        formatDescription(uiView.chartDescription)
        formatLegend(uiView.legend)
        formatDataSet(dataSet)
        uiView.notifyDataSetChanged()
    }
    
    
    class Coordinator : NSObject, ChartViewDelegate{
        
        var parent : PieChart
        
        init(parent: PieChart){
            self.parent = parent
            
        
        }
        
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            HapticManager.haptic.impactOccurred()
            let labelText = entry.value(forKey: "label") as! String
            let valueText = entry.value(forKey: "value") as! Double
            
            parent.pieChart.centerText = "\(labelText)\n $\(String(format: "%.2f", valueText))"
            
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func configureChart(_ pieChart: PieChartView){
        pieChart.animate(xAxisDuration: 0, yAxisDuration: 0.5, easingOption: .easeInCirc)
        pieChart.drawEntryLabelsEnabled = false
    }
    
    func formatCenter(_ pieChart: PieChartView){
        pieChart.centerText = "Financial Breakdown"
        
    }
    
    func formatDescription(_ pieChart: Description){
        
    }
    
    func formatLegend(_ legend: Legend){
       
        legend.enabled = false
        
    }
    
    func formatDataSet(_ dataSet: ChartDataSet){
        dataSet.drawValuesEnabled = false
    }
    
}
