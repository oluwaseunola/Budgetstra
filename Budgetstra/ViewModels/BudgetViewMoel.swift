//
//  BudgetViewMoel.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-24.
//

import Foundation

class BudgetViewModel : ObservableObject{
    
    @Published var budgets : [BudgetModel] = [BudgetModel(title: "December Budget", budget: 5000, spent: 1500)]
    
    
    
}
