//
//  ProfileImage.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-07.
//

import SwiftUI

struct ProfileImage: View {
    var imageURL : String
    
    var body: some View {
        if #available(iOS 15.0, *) {
            AsyncImage(url: URL(string: imageURL)) { image in
                
                image
                    .resizable().aspectRatio(contentMode:.fit)
                    .mask(Circle())
                
                
                
            } placeholder: {
                Image(systemName: "person").font(.system(size: 40))
                    .mask(Circle())
                    .overlay(Circle().stroke())
            }.frame(width:100, height: 100).shadow(color: Color.indigo.opacity(0.6), radius: 15, x: 10, y: 10)
        } else {
            // Fallback on earlier versions
        }
            

    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(imageURL: "https://robbreport.com/wp-content/uploads/2021/07/1-15.jpg?w=1000")
    }
}
