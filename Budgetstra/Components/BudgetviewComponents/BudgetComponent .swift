//
//  BudgetComponent .swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-24.
//

import SwiftUI

struct BudgetComponent_: View {
    
    @State var title : String
    @State var budget : Double
    @State var spent : Double?
    @Binding var currentTab : BudgetViewTab
    
    var body: some View {
        
HStack{
    
    TransactionImage(imageName: "Pay", color: "Pay")
    
    VStack(alignment:.leading){
            
            Text(title).lineLimit(1)
                .font(.custom(FontManager.extraBold, size: 12))
            
            HStack{
                
                Text("$\(String(format: "%.2f", spent ?? 0)) \(currentTab == .budget ? "used" : "saved")").lineLimit(1)
                    .font(.custom(FontManager.medium, size: 12))
                
                Spacer()
                
                Text("$\(String(format: "%.2f", budget))").lineLimit(1)
                    .font(.custom(FontManager.extraBold, size: 12))
                
            }
            
            
        ProgressView(value: (spent ?? 0)/budget)
            
        }
    
}.frame(maxWidth:.infinity).frame(height:120).padding(.horizontal).overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke().opacity(0.3))

    }
}

struct BudgetComponent__Previews: PreviewProvider {
    static var previews: some View {
        BudgetComponent_(title: "Monthly Limit", budget: 5000, currentTab:.constant(.budget))
    }
}
