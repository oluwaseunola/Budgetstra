//
//  BudgetViewMoel.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-24.
//

import Foundation

class BudgetViewModel : ObservableObject{
    
    @Published var budgets : [BudgetModel] = [BudgetModel(title: "December Budget", budget: 5000, spent: 1500)]
    @Published var savings : [SavingsModel] = [SavingsModel(title: "MacBook", total: 2600, saved: 250)]
    
    func addNewBudget(budgetObject: BudgetModel){
        
        budgets.append(budgetObject)
    }
    
    func deleteBudget(deletedObject: BudgetModel){
       
        var counter = 0
        
        for budget in budgets{
            counter += 1
            
            if budget.id == deletedObject.id{
                
                budgets.remove(at: counter - 1)
                
            }
            
        }
        
    }
    
    func updateBudget(updatedObject: BudgetModel){
        
        var counter = 0
        
        for budget in budgets{
            counter += 1
            
            if budget.id == updatedObject.id{
                
                budgets[counter-1] = updatedObject
                
            }
            
        }
        
        
    }
    
    func deleteSaving(deletedObject: SavingsModel){
       
        var counter = 0
        
        for saving in savings{
            counter += 1
            
            if saving.id == deletedObject.id{
                
                savings.remove(at: counter - 1)
                
            }
            
        }
        
    }
    
    
}

enum BudgetViewTab {
    
    case budget,saving
    
}
