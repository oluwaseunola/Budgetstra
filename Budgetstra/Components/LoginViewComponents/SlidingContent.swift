//
//  SlidingContent.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-06.
//

import SwiftUI

struct SlidingContent: View {
     var slideContent = [SlideShowModel(image: "manoffice", title: "Track your spending."), SlideShowModel(image: "invest", title: "Create budgets"), SlideShowModel(image: "charts", title: "Visualize your finances.")]
    @State var currentSlide = SlideShowModel(image: "manoffice", title: "Track your spending.")
    
    @State var counter = 0
    
    var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    
    var body: some View {
        
        VStack {
            
            Image(currentSlide.image).resizable().aspectRatio(contentMode:.fit)
                .frame(width: 200, height: 200)
            Text(currentSlide.title).font(.custom(FontManager.extraBold, size: 20)).frame(maxWidth:.infinity).lineLimit(1)
        }.frame(maxWidth:.infinity).onReceive(timer) { outPut in
            if counter > 2{
                counter = 0
            }

            withAnimation(.easeInOut) {
                currentSlide = slideContent[counter]
            }
            
            counter += 1
            
            
        }
        
        
        
        
        
        
        
    }
}

struct SlidingContent_Previews: PreviewProvider {
    static var previews: some View {
        SlidingContent()
    }
}
