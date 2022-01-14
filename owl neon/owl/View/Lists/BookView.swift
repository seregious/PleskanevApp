//
//  ListView.swift
//  owl
//
//  Created by Сергей Иванчихин on 11.01.2022.
//

import SwiftUI



struct BookView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
            if listViewModel.books.isEmpty {
                NoBooksView()
            } else {
                List {
                    ForEach(listViewModel.books) {book in
                        ListShowView(book: book)
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .navigationTitle("Books 📚")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: NavigationLink("Add", destination: AddView())
                )
       }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookView()
        } .environmentObject(ListViewModel())
    }
}


