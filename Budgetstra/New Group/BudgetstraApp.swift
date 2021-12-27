//
//  BudgetstraApp.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-05.
//

import SwiftUI

@main
struct BudgetstraApp: App {
    @StateObject var listViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(listViewModel)
        }
    }
}
