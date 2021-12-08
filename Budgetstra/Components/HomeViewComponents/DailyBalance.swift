//
//  DailyBalance.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-07.
//

import SwiftUI

struct DailyBalance: View {
    var body: some View {
        VStack{
            HStack{
                Image("dollar").resizable().aspectRatio(contentMode:.fit).background(Color.indigo).frame(width:30, height: 30).frame(maxWidth:50,maxHeight: 50).background(Color.indigo)
                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                VStack(alignment:.leading, spacing: 0){
                    Text("Today's balance").font(.custom(FontManager.medium, size: 15))
                    Text("$30,000.00").lineLimit(1)
                        .font(.custom(FontManager.extraBold, size: 20))
                }
                
                
            }.frame(height:80)
            
        }
    }
}

struct DailyBalance_Previews: PreviewProvider {
    static var previews: some View {
        DailyBalance()
    }
}
