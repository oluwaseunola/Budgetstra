//
//  GraphView.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-09.
//

import SwiftUI
import Charts

struct GraphView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    @EnvironmentObject var graphViewModel : GraphViewModel
    
    var body: some View {
        
       ZStack{
           LinearGradient(gradient: Gradient(colors: [            Color("backgroundColor2").opacity(0.6),Color("backgroundColor3")]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
           
           VStack{
               
               Text("Visualize your expenses.").font(.custom(FontManager.bold, size: 25)).padding(.top,50).padding(.horizontal)
           PieChart(entry: graphViewModel.entriesForTransactions(transactions: listViewModel.mockTransactions)).frame(height:400)
               
               
           }.padding(.horizontal,20
           )
           
           
           
       }
    
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView().environmentObject(GraphViewModel()).environmentObject(ListViewModel())
    }
}
