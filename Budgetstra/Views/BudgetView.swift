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
    @State var updateSavingIsPresented  = false
    @State var currentBudget : BudgetModel = BudgetModel(title: "", budget: 0)
    @State var currentSaving : SavingsModel = SavingsModel(title: "", total: 0)
    @State private var currentTab : BudgetViewTab = .budget
    
    init(){
        
        UITableView.appearance().backgroundColor = UIColor.white.withAlphaComponent(0.7)
        
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        
GeometryReader { geometry in
    
    ZStack(alignment:.top){
            
            LinearGradient(gradient: Gradient(colors: [            Color("backgroundColor2").opacity(0.6),Color("backgroundColor3")]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()

            VStack{
                Text(currentTab == .budget ? "Budget" : "Save").font(.custom(FontManager.bold, size: 25)).padding(.top,50).padding(.horizontal)
                
                
                ZStack(alignment:.top){
                    
                    
                    if currentTab == .budget{
                        
                        List{
                    
                    ForEach(budgetViewModel.budgets, id: \.id) { budget in
                        
                        BudgetComponent_(title: budget.title, budget: budget.budget, spent: budget.spent, currentTab: $currentTab)
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

                    
                    }.frame(height:geometry.size.height*0.75)
                        .offset(x: 0, y: 45)
                        
                    } else {
                        
                        List{
                        
                        ForEach(budgetViewModel.savings, id: \.id) { saving in
                            
                            BudgetComponent_(title: saving.title, budget: saving.total, spent: saving.saved, currentTab: $currentTab)
                                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                
                                    Button(role: .destructive) {
                                        withAnimation(.easeInOut) {
                                            budgetViewModel.deleteSaving(deletedObject: saving)
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
                                    
                                    
                                    currentSaving = saving
                                    
                                    withAnimation(.easeInOut) {
                                        updateSavingIsPresented = true

                                    }
                                    
                                    
                                }
                            
                        }.listRowBackground(Color.clear)

                        
                        }.frame(height:geometry.size.height*0.75)
                            .offset(x: 0, y: 45)

                    }
                    
                    
                        
                        HStack(spacing: geometry.size.width/3){
                           
                            Button {
                                HapticManager.haptic.impactOccurred()
                                
                                withAnimation(.linear) {
                                    currentTab = .budget

                                }
                                
                            } label: {
                                
                                VStack(spacing:5){
                                    Text("Budget")
                                    
                                    if currentTab == .budget{    RoundedRectangle(cornerRadius: 20).frame(width:75,height: 2)}
                                }
                            }

                            Button {
                                HapticManager.haptic.impactOccurred()

                                withAnimation(.linear) {
                                    currentTab = .saving

                                }
                            } label: {
                                
                                VStack(spacing:5){
                                    Text("Save")
                                    if currentTab == .saving{
                                        RoundedRectangle(cornerRadius: 20).frame(width:75,height: 2)
                                        
                                    }
                                }
                            }
                            
                        }.frame(maxWidth:.infinity).frame(height:50).background().cornerRadius(15).shadow(color: .black.opacity(0.2), radius:4, x: 0, y: 5).foregroundColor(.indigo)
                    
}
                
                
            }
            
            
            if updateBudgetIsPresented {
                
                UpdateBudget(budget: $currentBudget, isPresented: $updateBudgetIsPresented)
            }
            
        }}
    }
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView().environmentObject(BudgetViewModel()).previewInterfaceOrientation(.portrait)
    }
}
