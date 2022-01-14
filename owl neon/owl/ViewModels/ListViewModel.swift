//
//  File.swift
//  owl
//
//  Created by Сергей Иванчихин on 12.01.2022.
//

/*
 CRUD Functions
 
 Create
 Read
 Update
 Delete
 
 */

import Foundation

class ListViewModel : ObservableObject {
    @Published var books: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    let booksKey = "books_list"
    
    init() {
        getBooks()
    }
    
    func getBooks() {
        guard
            let data = UserDefaults.standard.data(forKey: booksKey),
            let savedBooks = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.books = savedBooks
    }
    
    func deleteItem (indexSet: IndexSet){
        books.remove(atOffsets: indexSet)
    }
    
    func moveItem (from: IndexSet, to: Int) {
        books.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String, author: String = "") {
        let newItem = ItemModel(title: title, author: author, review: "", score: 0, isCompleted: false)
        books.append(newItem)
    }
    
    func updateItem(book: ItemModel) {
        if let index = books.firstIndex(where: {$0.id == book.id}) {
            books[index] = book.updateComplete()
        }
    }
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(books) {
            UserDefaults.standard.set(encodedData, forKey: booksKey)
        }
    }
    
 
    func editItem(book: ItemModel, title: String?, author: String?, review: String?, score: Double?, isCompleted: Bool?)  {
        if let index = books.firstIndex(where: {$0.id == book.id}) {
            books[index] = book.editItem(newTitle: title ?? book.title, newAuthor: author ?? book.author, newReview: review ?? book.review, newScore: score ?? book.score, isCompleted: isCompleted ?? book.isCompleted)
        }
    }
    
}
