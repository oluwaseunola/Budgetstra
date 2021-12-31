//
//  CustomTabBar.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-09.
//

import SwiftUI

struct CustomTabBar: View {
    @State var currentTab : TabType = .home
    @State var bounce : Bool = false
    @State var newTransationWindowIsPresented = false
    @State var newBudgetWindowIsPresented = false
    @StateObject var budgetViewModel = BudgetViewModel()

    
    
    
    
    var body: some View {
        
        ZStack(alignment:.bottom){
            
            switch currentTab {
            case .home:
                HomeView()
            case .budget:
                BudgetView().environmentObject(budgetViewModel)
            case .graph:
                GraphView()
            case .account:
                AccountView()
            }
            
            
            
            HStack{
                
                ForEach(tabs[0...1], id:\.id){ tab in
                    
                    Button {
                        currentTab = tab.tab
                        bounceAnimation()
                    
                    } label: {
                        VStack{
                           
                            Image(systemName: currentTab == tab.tab ? "\(tab.image).fill" : tab.image)
                                .font(Font.title.weight(currentTab == tab.tab ? .heavy : .regular))
                                .imageScale(bounce && currentTab == tab.tab ? .medium : .small)
                                
                            Text(tab.title).font(.custom(currentTab == tab.tab ? FontManager.bold : FontManager.medium , size: 12))
                            
                        }.foregroundColor(.indigo)
                        
                    }.frame(maxWidth:.infinity)

                    
                }
                    
                        
                       
                        
                        Menu {
                            
                            Button {
                                
                                HapticManager.haptic.impactOccurred()

                                currentTab = .home
                                
                                withAnimation(.linear) {
                                    newTransationWindowIsPresented = true
                                    
                                }
                                
                                
                            } label: {
                                Text("Add transaction")
                            }
                            
                            Button {
                                HapticManager.haptic.impactOccurred()

                                currentTab = .budget
                                
                                withAnimation(.linear) {
                                    newBudgetWindowIsPresented = true
                                    
                                }
                                
                                
                            } label: {
                                Text("Add budget")

                            }


                        } label: {
                            
                            Image(systemName: "plus.circle").font(.system(size: 40)).foregroundColor(.indigo)
                            
                        }

                        

                                      
                ForEach(tabs[2...3], id:\.id){ tab in
                    
                    Button {
                        currentTab = tab.tab
                        bounceAnimation()

                    } label: {
                        VStack{
                            
                            Image(systemName: currentTab == tab.tab ? "\(tab.image).fill" : tab.image)
                                .font(Font.title.weight(currentTab == tab.tab ? .heavy : .regular))
                                .imageScale(bounce && currentTab == tab.tab ? .medium : .small)
                            
                            Text(tab.title).font(.custom(currentTab == tab.tab ? FontManager.bold : FontManager.medium , size: 12))
                            
                        }.foregroundColor(.indigo)
                    }.frame(maxWidth:.infinity)
                }

                    
                
                
            }.frame(height:100).background(.ultraThinMaterial).mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                
            
            if newTransationWindowIsPresented {
                
                NewTransaction(isPresented:$newTransationWindowIsPresented)
            }
            
            if newBudgetWindowIsPresented{
                
                NewBudget(isPresented:$newBudgetWindowIsPresented).environmentObject(budgetViewModel)
            }
            
            
        }
        .frame(maxHeight:.infinity,alignment: .bottom).ignoresSafeArea()
        
       
        
            
            
            
    }
    
    
        
    
    private func bounceAnimation(){
        HapticManager.haptic.impactOccurred()
        withAnimation(.spring(response: 0.7, dampingFraction: 0.5, blendDuration: 0.8)) {
           
            bounce = true
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                
                bounce = false
            }
        }
        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar().environmentObject(ListViewModel())
    }
}


