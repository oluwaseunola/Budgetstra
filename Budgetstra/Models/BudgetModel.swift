//
//  BudgetModel.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-24.
//

import Foundation

struct BudgetModel:Identifiable {
    
    var id = UUID()
    var title : String
    var budget : Double
    var spent : Double?
    
}

struct SavingsModel:Identifiable {
    
    var id = UUID()
    var title : String
    var total : Double
    var saved : Double?
    
}
