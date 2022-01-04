//
//  ListViewModel.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-10.
//

import Foundation

class ListViewModel : ObservableObject {
    
    @Published var mockTransactions = [TransactionModel(category: .pay, value: 300), TransactionModel(category: .clothing, value: 20), TransactionModel(category: .donation, value: 25)]
    @Published var filteredTransactions = [TransactionModel]()
    @Published var totalIncome : Double = 0.0
    @Published var totalExpenes : Double = 0.0
    @Published var grossCalculation : Double = 0.0
    
    
    init(){
       updateAll()
    }
    
    func addNewTransaction(object: TransactionModel){
        
        mockTransactions.append(object)
        updateAll()
        
    }
    
    func updateAll(){
        updateIncome()
        updateExpenses()
        calculateGross()
        
    }
    
    func updateIncome(){
        
        var income : Double = 0.0
        
        mockTransactions.forEach { transaction in
            
            if transaction.category == .pay {
                
                income += transaction.value
                
            }
            
        }
        
        
        totalIncome = income
        
    }
    
    func updateExpenses(){
        
        var expenses : Double = 0.0
        
        mockTransactions.forEach { transaction in
            
            if transaction.category != .pay {
                
                expenses += transaction.value
                
            }
            
        }
        
        
        totalExpenes = expenses
        
    }
    
    func calculateGross(){
        
        grossCalculation = totalIncome - totalExpenes
        
    }
    
    func filterTransactions(text: String){
        
        filteredTransactions.removeAll()
        
        for transaction in mockTransactions {
            
            if transaction.category.rawValue.lowercased().range(of: text.lowercased()) != nil{
                filteredTransactions.append(transaction)
                
            }
            
        }
        
        
    }
    
    
    func deleteTransaction(deletedObject: TransactionModel){
       
        var counter = 0
        
        for transaction in mockTransactions{
            counter += 1
            
            if transaction.id == deletedObject.id{
                
                mockTransactions.remove(at: counter - 1)
                
            }
            
        }
        
        updateAll()
        
    }
    
    
}
