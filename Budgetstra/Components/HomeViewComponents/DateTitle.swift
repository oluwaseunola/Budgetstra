//
//  DateTitle.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-07.
//

import SwiftUI

struct DateTitle: View {
    
    
    var body: some View {
        Text("\(Date.now.formatted(.dateTime.year().month().day()))").font(.custom(FontManager.bold, size: 20))
    }
}

struct DateTitle_Previews: PreviewProvider {
    static var previews: some View {
        DateTitle()
    }
}
