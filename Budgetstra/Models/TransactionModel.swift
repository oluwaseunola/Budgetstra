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
    var value : Int
    

    
}

enum TransactionCategory : String, Decodable {
    
case foodDrink = "Food & Drink", investment = "Investment", bill = "Bill", entertainment = "Entertainment", donation = "Charity", travel = "Travel", automotiveExpense = "Automotive Expense", education = "Education", groceries = "Groceries", pay = "Pay", pets = "Pets", savings = "Savings", clothing = "Clothing", healthCare = "Healthcare"
    
    
}

var mockTransactions = [TransactionModel(category: .pay, value: 300), TransactionModel(category: .clothing, value: 20), TransactionModel(category: .donation, value: 25)]


