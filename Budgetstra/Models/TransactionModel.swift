//
//  TransactionModel.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-07.
//

import Foundation

struct TransactionModel: Identifiable, Decodable {
    
    var id = UUID()
    var category : TransactionCategory
    var value : Double
    

    
}

enum TransactionCategory : String, Decodable,CaseIterable {

    case automotiveExpense = "Automotive Expense", bill = "Bill", clothing = "Clothing", donation = "Charity",education = "Education", entertainment = "Entertainment",foodDrink = "Food & Drink",groceries = "Groceries",healthCare = "Healthcare",investment = "Investment", pay = "Pay", pets = "Pets", travel = "Travel", savings = "Savings"
    
 
    
    
}

var mockTransactions = [TransactionModel(category: .pay, value: 300), TransactionModel(category: .clothing, value: 20), TransactionModel(category: .donation, value: 25)]


