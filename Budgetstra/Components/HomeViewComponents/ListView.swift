//
//  ListView.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-08.
//

import SwiftUI

struct ListView: View {
    
    init(){
        
        UITableView.appearance().backgroundColor = UIColor.white.withAlphaComponent(0.3)
        
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        
        List(mockTransactions, id:\.id){ transaction in
            
            HStack{
                
                switch transaction.category{
                    
                case.donation:
                    TransactionImage(imageName: "give", color: "give")
                case .foodDrink:
                    TransactionImage(imageName: "food", color: "food")
                case .investment:
                    TransactionImage(imageName: "invest", color: "invest")

                case .bill:
                    TransactionImage(imageName: "bill", color: "bill")

                case .entertainment:
                    TransactionImage(imageName: "entertain", color: "entertain")

                case .travel:
                    TransactionImage(imageName: "travel", color: "travel")

                case .automotiveExpense:
                    TransactionImage(imageName: "auto", color: "auto")

                case .education:
                    TransactionImage(imageName: "education", color: "education")

                case .groceries:
                    TransactionImage(imageName: "grocery", color: "grocery")

                case .pay:
                    TransactionImage(imageName: "pay", color: "pay")

                case .pets:
                    TransactionImage(imageName: "pet", color: "pet")

                case .savings:
                    TransactionImage(imageName: "saving", color: "saving")

                case .clothing:
                    TransactionImage(imageName: "clothing", color: "clothing")

                case .healthCare:
                    TransactionImage(imageName: "health", color: "health")

                }
                
                
                Text(transaction.category.rawValue).font(.custom(FontManager.medium, size: 20))
               
                Spacer()
                
                Text("\(transaction.value)").font(.custom(FontManager.bold, size: 20)).foregroundColor(transaction.category == .pay ? .green : .red)
                
            }
            .listRowBackground(Color.clear).padding(.top).padding(.bottom)
            
            
            
        }
            .frame(height:300)
            .frame(maxWidth:.infinity)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
