//
//  ListShowView.swift
//  owl
//
//  Created by Сергей Иванчихин on 11.01.2022.
//

import SwiftUI



struct ListShowView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    let book : ItemModel
    
    var body: some View {
        
        HStack {
            Image(systemName: book.label)
                    .foregroundColor(book.color)
                    .onTapGesture {
                        listViewModel.updateItem(book: book)
                    }
                Text(book.title + ", " + book.author)
                .frame(width: 300, alignment: .leading)
            NavigationLink(destination: EditView(book: book, titleText: book.title, authorText: book.author, reviewText: book.review, scoreText: book.score, finished: book.isCompleted)) {
                    
                }
            }
        
    }
}


struct ListShowView_Previews: PreviewProvider {
        
    static  var book1 = ItemModel(title: "Game of thrones", author: "G. R. R. Martin", review: "", score: 0, isCompleted: false)
    
    static var previews: some View {
        NavigationView{
            ListShowView(book: book1)
        } .environmentObject(ListViewModel())
    }
}
