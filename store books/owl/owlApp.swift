//
//  owlApp.swift
//  owl
//
//  Created by Сергей Иванчихин on 11.01.2022.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for View
 */

@main
struct owlApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                BookView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(ListViewModel())
        }
    }
}
