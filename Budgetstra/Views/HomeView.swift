//
//  HomeView.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-07.
//

import SwiftUI

struct HomeView: View {
    
    @State var transactions = [TransactionModel]()
    @EnvironmentObject var listViewModel : ListViewModel
    @State var searchText = ""
    @State var isSearching = false
    @FocusState var isFocused : Bool
    
    var body: some View {
        ZStack(alignment:.top){
            LinearGradient(gradient: Gradient(colors: [            Color("backgroundColor2").opacity(0.6),Color("backgroundColor3")]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            
            
            
            ScrollView(showsIndicators:false) {
                VStack(alignment:.leading){
                    
                    Text("Hey there, Seun.")
                        .font(.custom(FontManager.bold, size: 35))
                        .padding(.top,40)
                    HStack{
                        
                        DailyBalance()
                        
                        Spacer()
                        
                        ProfileImage(imageURL: "https://robbreport.com/wp-content/uploads/2021/07/1-15.jpg?w=1000")
                        
                    }.frame(maxWidth:.infinity, alignment: .leading)
                    
                    
                    VStack{
                        HStack{
                            Text("All transactions").font(.custom(FontManager.bold, size: 25))
                            
                            
                            
                            Spacer()
                            Button {
                                
                                withAnimation(Animation.easeInOut) {
                                    isSearching.toggle()
                                    isFocused = true
                                }
                                
                                listViewModel.filteredTransactions.removeAll()
                                
                            } label: {
                                
                                Image(systemName: "magnifyingglass").foregroundColor(.white).background(Color.indigo).frame(width:50, height: 50).frame(maxWidth:50,maxHeight: 50).background(Color.indigo)
                                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                
                                
                            }
                            
                            Button {
                                //                            Query and display data from different calendar days
                            } label: {
                                
                                Image(systemName: "calendar").foregroundColor(.white).background(Color.indigo).frame(width:50, height: 50).frame(maxWidth:50,maxHeight: 50).background(Color.indigo)
                                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            }
                            
                            
                            
                        }.padding(.top,20)
                        
                        if isSearching {
                            
                            searchBox
                            
                        }
                    }
                    VStack {
                        DateTitle()
                        HStack{
                            
                            IncomeExpense(image: "arrow.up", color: "income", type: "Income", amount: String(listViewModel.totalIncome))
                            Spacer()
                            IncomeExpense(image: "arrow.down", color: "expense", type: "Expenses", amount: String(listViewModel.totalExpenes))
                            
                            
                        }.frame(maxWidth:.infinity)
                        
                        ListView(isSearching: $isSearching)
                        
                    }.padding(.top,20)
                    
                    
                }.padding(.horizontal).padding(.bottom,50)
                
                
            }.padding(.top,20)
                .padding(.bottom,70)
            
            
            
        }
        
        
    }
    
    var searchBox : some View {
        
        
        HStack{
            
            ZStack{
                
                Color.secondary.opacity(0.3)
                
                HStack{
                    
                    Image(systemName: "magnifyingglass").padding(.leading,10)
                    
                    TextField("", text: $searchText, prompt: Text("Search transactions").font(.custom(FontManager.medium, size: 12))).frame(maxWidth:.infinity).frame(height:45)
                        .multilineTextAlignment(.center)
                        .focused($isFocused)
                        .onSubmit {
                            listViewModel.filterTransactions(text: searchText)
                        }
                    
                    
                }
                
            }.mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
            
            
            
            
            Button {
                
                withAnimation(Animation.easeInOut) {
                    isSearching = false
                    isFocused = false
                }
                
            } label: {
                Text("Cancel").font(.custom(FontManager.medium, size: 16))
            }
            
            
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ListViewModel())
    }
}
