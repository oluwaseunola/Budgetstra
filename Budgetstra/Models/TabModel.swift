//
//  TabModel.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-09.
//

import Foundation

enum TabType: String{
    
    case home,budget,graph,account
}

struct TabModel : Identifiable{
    var id = UUID()
    var title : String
    var image : String
    var tab : TabType
    
}

var tabs = [TabModel(title: "Home", image: "house", tab: .home), TabModel(title: "Budget", image: "dollarsign.circle", tab: .budget), TabModel(title: "Summary", image: "chart.pie", tab: .graph), TabModel(title: "Account", image: "person", tab: .account)]

