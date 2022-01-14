//
//  TabMenuView.swift
//  owl
//
//  Created by Сергей Иванчихин on 14.01.2022.
//

import SwiftUI

struct TabMenuView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    @State var hideNavigationBar = true
    
    var body: some View {
        
            TabView {
                NavigationView {
                BookView()
                }
                    .tabItem({
                        Image(systemName: "books.vertical")
                        Text("Books")
                    })
                NavigationView {
                FilmView()
                }
                    .tabItem({
                        Image(systemName: "film")
                        Text("Films")
                    })
                NavigationView {
                MusicView()
                }
                    .tabItem({
                        Image(systemName: "airpodsmax")
                        Text("Music")
                    })
                NavigationView {
                GameView()
                }
                    .tabItem({
                        Image(systemName: "gamecontroller.fill")
                        Text("Games")
                    })
            }
    }
} 

struct TabMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        TabMenuView()
        } .environmentObject(ListViewModel())
    }
}
