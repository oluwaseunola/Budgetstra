//
//  GraphViewModel.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2022-01-03.
//

import Foundation
import Charts
import SwiftUI

class GraphViewModel : ObservableObject {
    
    
     func entriesForTransactions(transactions: [TransactionModel])-> [PieChartDataEntry]{
        
         let combinedTransactions = combineTransactions(transactions)
        
        
        let pieChartData = combinedTransactions.map{PieChartDataEntry(value: $0.value, label: $0.category.rawValue)}
        
        return pieChartData
    }
    
    func combineTransactions(_ transactions: [TransactionModel])-> [TransactionModel]{
        
        var allTransactions : [String:TransactionModel] = [
            
            "savings":TransactionModel(category: .savings, value: 0),
            "auto":TransactionModel(category: .automotiveExpense, value: 0),
            "bill":TransactionModel(category: .bill, value: 0),
            "clothing":TransactionModel(category: .clothing, value: 0),
            "donation":TransactionModel(category: .donation, value: 0),
            "education":TransactionModel(category: .education, value: 0),
            "entertainment":TransactionModel(category: .entertainment, value: 0),
            "food":TransactionModel(category: .foodDrink, value: 0),
            "groceries":TransactionModel(category: .groceries, value: 0),
            "healthcare":TransactionModel(category: .healthCare, value: 0),
            "investment":TransactionModel(category: .investment, value: 0),
            "pay":TransactionModel(category: .pay, value: 0),
            "pets":TransactionModel(category: .pets, value: 0),
            "travel":TransactionModel(category: .travel, value: 0)
        ]
        
        
        for transaction in transactions {
            
            switch transaction.category{
                
            case .automotiveExpense:
                
                allTransactions["auto"]?.value += transaction.value
                
            case .bill:
                allTransactions["bill"]?.value += transaction.value

            case .clothing:
                allTransactions["clothing"]?.value += transaction.value

            case .donation:
                allTransactions["donation"]?.value += transaction.value

            case .education:
                allTransactions["education"]?.value += transaction.value

            case .entertainment:
                allTransactions["entertainment"]?.value += transaction.value

            case .foodDrink:
                allTransactions["food"]?.value += transaction.value

            case .groceries:
                allTransactions["groceries"]?.value += transaction.value

            case .healthCare:
                allTransactions["healthcare"]?.value += transaction.value

            case .investment:
                allTransactions["investment"]?.value += transaction.value

            case .pay:
                allTransactions["pay"]?.value += transaction.value

            case .pets:
                allTransactions["pets"]?.value += transaction.value

            case .travel:
                allTransactions["travel"]?.value += transaction.value

            case .savings:
                allTransactions["savings"]?.value += transaction.value

            }
            
        }
        
        let finalTransactions = allTransactions.filter{$0.value.value != 0}.map{$0.value}
        
        
        
        
        
        return finalTransactions
    }
    
    
    
}
