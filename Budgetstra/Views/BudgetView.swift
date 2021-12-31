//
//  BudgetView.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-09.
//

import SwiftUI

struct BudgetView: View {
    @EnvironmentObject var budgetViewModel : BudgetViewModel
    @State var updateBudgetIsPresented  = false
    @State var currentBudget : BudgetModel = BudgetModel(title: "", budget: 0)
    
    init(){
        
        UITableView.appearance().backgroundColor = UIColor.white.withAlphaComponent(0.3)
        
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        ZStack(alignment:.top){
            
            LinearGradient(gradient: Gradient(colors: [            Color("backgroundColor2").opacity(0.6),Color("backgroundColor3")]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()

            VStack(alignment:.leading){
                Text("Budget & Save").font(.custom(FontManager.bold, size: 25))
                
                
                List{
                    
                    ForEach(budgetViewModel.budgets, id: \.id) { budget in
                        
                        BudgetComponent_(title: budget.title, budget: budget.budget, spent: budget.spent)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            
                                Button(role: .destructive) {
                                    withAnimation(.easeInOut) {
                                        budgetViewModel.deleteBudget(deletedObject: budget)
                                    }
                                } label: {
                                                                        Image(systemName: "trash")

                                }
                                
                                Button {
//                                Edit budget
                                } label: {
                                    Image(systemName: "pencil")
                                }.tint(.yellow)


                                

                        }
                            .onTapGesture {
                                
                                
                                currentBudget = budget
                                
                                withAnimation(.easeInOut) {
                                    updateBudgetIsPresented = true

                                }
                                
                                
                            }
                        
                    }.listRowBackground(Color.clear)

                    
                }.mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    
                
                
            }.padding(.horizontal).padding(.top,50)
            
            
            if updateBudgetIsPresented {
                
                UpdateBudget(budget: $currentBudget, isPresented: $updateBudgetIsPresented)
            }
            
        }
    }
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView().environmentObject(BudgetViewModel())
    }
}
