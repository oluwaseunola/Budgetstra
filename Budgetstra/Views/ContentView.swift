//
//  ContentView.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            
            
            CustomTabBar()
            
            
            
            
            
//            VStack {
//                SlidingContent()
//                Spacer()
//                LoginCard()
//            }
        }.statusBar(hidden: true)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
