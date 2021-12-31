//
//  UpdateBudget.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-30.
//

import SwiftUI

struct UpdateBudget: View {
    
    @Binding var budget : BudgetModel
    @Binding  var isPresented : Bool
    
    @State var amountLabel = ""
    @FocusState var isFocused : Bool
    
    @State var selectedCategory : TransactionCategory = .automotiveExpense
    @EnvironmentObject var budgetViewModel : BudgetViewModel
    
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                
                BlurView(style: .systemUltraThinMaterialDark)
            }.ignoresSafeArea()
                .onTapGesture {
                    isPresented = false
                }
            
            
            VStack(alignment:.leading){
                /// MARK: - Title
                
                Text(budget.title).font(.custom(FontManager.bold, size: 30)).padding(.top,50)
                
                Text("Budget: $\(String(format: "%.2f", budget.budget))").font(.custom(FontManager.medium, size: 20)).padding(.top,30)
                
                /// //MARK: - Amount
                Spacer()
                
                VStack{
                    
                    
                    Group{
                        ZStack{
                            
                            HStack{
                                Text("$").font(.custom(FontManager.bold, size: 30)).padding()
                                Spacer()
                                
                            }
                            
                            
                            TextField("Amount used", text: $amountLabel, prompt: nil).font(.custom(FontManager.medium, size: 24)).frame(maxWidth:.infinity).frame(height:70).overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke().foregroundColor(.secondary))
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                                .keyboardType(.decimalPad)
                                .focused($isFocused)
                            
                            
                            
                        }
                        
                    }
                }
                
                
                
                
                
                HStack{
                    
                    Button {
                        isPresented = false
                    } label: {
                        
                        Text("Cancel").foregroundColor(.white).frame(maxWidth:.infinity).frame(height:50).background(Color.indigo)
                            .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    }
                    
                    Button {
                        
                        if let budgetSpent = budget.spent{
                            
                            budgetViewModel.updateBudget(updatedObject: BudgetModel(title: budget.title, budget: budget.budget, spent: Double(amountLabel) ?? 0 + budgetSpent))
                            
                        }else{
                            
                            budgetViewModel.updateBudget(updatedObject: BudgetModel(title: budget.title, budget: budget.budget, spent: Double(amountLabel) ?? 0))
                        }
                        
                        isPresented = false
                        
                        HapticManager.haptic.impactOccurred()
                        
                    } label: {
                        
                        Text("Update").foregroundColor(.white).frame(maxWidth:.infinity).frame(height:50)
                            .background(Color.indigo)
                            .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        
                    }
                    
                    
                    
                    
                }.frame(maxWidth:.infinity)
                    .padding(.top,50)
                
                
                Spacer()
                
                
                
                
            }   .padding(.horizontal).frame(maxWidth:.infinity, alignment: .top).frame(height:500)
                .background(LinearGradient(gradient: Gradient(colors: [            Color("backgroundColor2").opacity(0.6),Color("backgroundColor3")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .padding(.horizontal)
                .onTapGesture {
                    isFocused = false
                    
                }
            
            
            
            
        }
    }
}

//struct UpdateBudget_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateBudget(isPresented: .constant(true), budgetName: "December Budget", budget: 25.0)
//    }
//}
