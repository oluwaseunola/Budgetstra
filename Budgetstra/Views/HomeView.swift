//
//  HomeView.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-07.
//

import SwiftUI

struct HomeView: View {
    
    @State var transactions = [TransactionModel]()
    var body: some View {
        ZStack(alignment:.top){
            LinearGradient(gradient: Gradient(colors: [            Color("backgroundColor2").opacity(0.6),Color("backgroundColor3")]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            
            
           
            ScrollView(showsIndicators:false) {
                VStack(alignment:.leading){
                    
                    Text("Hey there, Seun.")
                        .font(.custom(FontManager.bold, size: 35))
                        .padding(.top,12)
                    HStack{
                        
                        DailyBalance()
                        
                        Spacer()
                        
                        ProfileImage(imageURL: "https://robbreport.com/wp-content/uploads/2021/07/1-15.jpg?w=1000")
                        
                    }.frame(maxWidth:.infinity, alignment: .leading)
                        
                    
                    HStack{
                        Text("All transactions").font(.custom(FontManager.bold, size: 25))
                        Spacer()
                        Button {
//                            Query old transactions
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
                    
                    VStack {
                        DateTitle()
                        HStack{
                            
                            IncomeExpense(image: "arrow.up", color: "income", type: "Income", amount: "600.00")
                        Spacer()
                            IncomeExpense(image: "arrow.down", color: "expense", type: "Expenses", amount: "20.00")
                        
                        }.frame(maxWidth:.infinity)
                        
                        ListView()
                        
                    }.padding(.top,20)
                    
                    

                    
                }.padding(.horizontal)

                

                
                
            }
           
            
            

        }
        

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
