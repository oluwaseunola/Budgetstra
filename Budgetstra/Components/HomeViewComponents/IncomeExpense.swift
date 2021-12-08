//
//  IncomeExpense.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-07.
//

import SwiftUI

struct IncomeExpense: View {
    var image: String
    var color : String
    var type : String
    var amount : String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: image).foregroundColor(.white).background(Color(color)).frame(width:20, height: 20).frame(maxWidth:30,maxHeight: 30).background(Color(color))
                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                VStack(alignment:.leading, spacing: 0){
                    Text(type).font(.custom(FontManager.medium, size: 15))
                    Text("$\(amount)").lineLimit(1)
                        .font(.custom(FontManager.extraBold, size: 15
                                     ))
                }
                
                
            }
            
        }.frame(width:150,height:80 )
            .background(.thinMaterial)
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct IncomeExpense_Previews: PreviewProvider {
    static var previews: some View {
        IncomeExpense(image: "arrow.up", color: "income", type: "Income", amount: "30,000.00")
    }
}
