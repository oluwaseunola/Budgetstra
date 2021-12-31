//
//  NewBudget.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-10.
//

import SwiftUI

struct NewBudget: View {
    @Binding  var isPresented : Bool
    @State var amountLabel  = ""
    @State var titleLabel = ""
    @State var selectedCategory : TransactionCategory = .automotiveExpense
    @EnvironmentObject var budgetViewModel : BudgetViewModel
//    @FocusState var isFocused : Bool
    
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
                
                Text("New Budget").font(.custom(FontManager.bold, size: 30)).padding(.top,50)
                    
                /// //MARK: - Amount
               Spacer()
                
                VStack{
                   
                    TextField("Budget Name", text: $titleLabel, prompt: nil).font(.custom(FontManager.medium, size: 24)).frame(maxWidth:.infinity).frame(height:70).overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke().foregroundColor(.secondary))
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                    
                    Group{
                        ZStack{
                        
                        HStack{
                            Text("$").font(.custom(FontManager.bold, size: 30)).padding()
                            Spacer()
                            
                        }
                            
                        
                            TextField("Enter Budget", text: $amountLabel, prompt: nil).font(.custom(FontManager.medium, size: 24)).frame(maxWidth:.infinity).frame(height:70).overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke().foregroundColor(.secondary))
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                                .keyboardType(.decimalPad)

//                                .focused($isFocused)
                                
                                
                       
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
                                                
                        budgetViewModel.addNewBudget(budgetObject: BudgetModel(title: titleLabel, budget: Double(amountLabel) ?? 0))
                        
                        isPresented = false
                        
                        HapticManager.haptic.impactOccurred()
                        
                    } label: {
                        
                        Text("Add").foregroundColor(.white).frame(maxWidth:.infinity).frame(height:50)
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
//                    isFocused = false
                
                }
                
                
            
            
        }
    }
}

struct NewBudget_Previews: PreviewProvider {
    static var previews: some View {
        NewBudget(isPresented: .constant(true)).environmentObject(BudgetViewModel())
    }
}


