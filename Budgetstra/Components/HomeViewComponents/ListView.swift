//
//  ListView.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-08.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    @Binding var isSearching : Bool
    
    init(isSearching: Binding<Bool>){
        
        self._isSearching = isSearching
        
        UITableView.appearance().backgroundColor = UIColor.white.withAlphaComponent(0.3)
        
        UITableView.appearance().showsVerticalScrollIndicator = false
        
    }
    
    var body: some View {
        
        List(isSearching ? listViewModel.filteredTransactions : listViewModel.mockTransactions, id:\.id){ transaction in
            
                HStack{
                    
                    TransactionImage(imageName: transaction.category.rawValue, color: transaction.category.rawValue)
                    
                    Text(transaction.category.rawValue).font(.custom(FontManager.medium, size: 20))
                   
                    Spacer()
                    
                    Text("\(String(format: "%.2f", transaction.value))").font(.custom(FontManager.bold, size: 20)).foregroundColor(transaction.category == .pay ? .green : .red)
                    
                }
                .listRowBackground(Color.clear).padding(.top).padding(.bottom)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                
                    Button (role:.destructive){
                    
                    withAnimation(.easeInOut) {
                        listViewModel.deleteTransaction(deletedObject: transaction)
                    }
                    
            
                } label: {
                  
                        Image(systemName: "trash")

                }
            }
             
            
        }
            .frame(height:300)
            .frame(maxWidth:.infinity)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(isSearching: .constant(false)).environmentObject(ListViewModel())
    }
}
