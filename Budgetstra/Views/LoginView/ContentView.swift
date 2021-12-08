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
            Color("backgroundColor1").ignoresSafeArea()
            
            VStack {
                SlidingContent()
                Spacer()
                LoginCard()
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
