//
//  TransactionImage.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-08.
//

import SwiftUI

struct TransactionImage: View {
    var imageName : String
    var color : String
    var body: some View {
        
        Image(imageName).resizable().aspectRatio( contentMode: .fit).frame(width: 25, height: 25).background(Color(color)).frame(width: 50, height: 50).background(Color(color)).mask { Circle()}
        
        
    }
}

struct TransactionImage_Previews: PreviewProvider {
    static var previews: some View {
        TransactionImage(imageName: "pay", color: "pay")
    }
}
