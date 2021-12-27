//
//  NewTransaction.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-10.
//

import SwiftUI

struct NewTransaction: View {
    @Binding  var isPresented : Bool
    @State var amountLabel  = ""
    @State var selectedCategory : TransactionCategory = .automotiveExpense
    @EnvironmentObject var listViewModel : ListViewModel
    @State var showAlert = false
    @FocusState var isFocused : Bool
    
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
                
                Text("New Transaction").font(.custom(FontManager.bold, size: 30)).padding(.top,50)
                    
                /// //MARK: - Amount
               Spacer()
                
                    ZStack{
                        
                        HStack{
                            Text("$").font(.custom(FontManager.bold, size: 30)).padding()
                            Spacer()
                            
                        }
                    
                    
                        
                            TextField("Enter Amount", text: $amountLabel, prompt: nil).font(.custom(FontManager.medium, size: 24)).frame(maxWidth:.infinity).frame(height:70).overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke().foregroundColor(.secondary))
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                                .keyboardType(.decimalPad)

                                .focused($isFocused)
                                
                                
                       
}
                
                
/// MARK: - Menu Selector
                
                Menu {
                    
                        ForEach(TransactionCategory.allCases,id: \.self){ transaction in
                            
                            
                            Button {
                                HapticManager.haptic.impactOccurred()
                                selectedCategory = transaction
                            } label: {
                                
                                Text(transaction.rawValue)

                            }

                            
                        }
                    
                    
                } label: {
                    
                    Label {
                        VStack(alignment:.leading){
                            
                            Text("Category").font(.custom(FontManager.medium, size: 24))
                            Label {
                                Text(selectedCategory.rawValue)
                            } icon: {
                                TransactionImage(imageName: selectedCategory.rawValue, color: selectedCategory.rawValue)
                            }.frame(maxWidth:.infinity).frame(height:70).overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke().foregroundColor(.secondary))
                            
                        }
                        
                        
                    } icon: {
                        Image(systemName: "plus")
                    }


                }.foregroundColor(.indigo)

                
                
                HStack{
                    
                    Button {
                        isPresented = false
                    } label: {
                        
                        Text("Cancel").foregroundColor(.white).frame(maxWidth:.infinity).frame(height:50).background(Color.indigo)
                            .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    }
                    
                    Button {
                        
                        if amountLabel == "0.00" || amountLabel == ""{
                            
                            showAlert = true
                            
                        }
                        
                        listViewModel.addNewTransaction(object: TransactionModel(category: selectedCategory, value: Double(amountLabel) ?? 0) )
                        
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
                    isFocused = false
                
                }
                
                
            
            
        }
    }
}

struct NewTransaction_Previews: PreviewProvider {
    static var previews: some View {
        NewTransaction(isPresented: .constant(true)).environmentObject(ListViewModel())
    }
}


