//
//  EditView.swift
//  owl
//
//  Created by Сергей Иванчихин on 12.01.2022.
//

import SwiftUI


struct EditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewVodel : ListViewModel
    
    let book : ItemModel
    
    @State var titleText : String
    @State var authorText : String
    @State var reviewText : String
    @State var scoreText : Double
    @State var finished : Bool

    
    var body: some View {
            ScrollView {
            VStack {
            Section (header: Text("Title")) {
                TextField(book.title, text: $titleText)
                .padding()
                .background(.ultraThickMaterial)
                .cornerRadius(30)
            }
            Section (header: Text("Author")) {
                TextField(book.title, text: $authorText)
                    .padding()
                    .background(.ultraThickMaterial)
                    .cornerRadius(30)
            }
            Section (header: Text("Review")) {
                TextField(book.review, text: $reviewText)
                    .padding()
                    .frame(height: 100)
                    .background(.ultraThickMaterial)
                    .cornerRadius(30)
                    
            }
                Section (header: Text("Score \(scoreText, specifier: "%.1f")")) {
                Slider(value: $scoreText, in: 0...10, step: 0.5)
                    .padding(1)
                } .padding()
                
                
                
                Button(action: {
                    editButtonPressed()
                }, label: {
                    Text("Save")
                        .modifier(standartButton())
                })
            }
            .padding()
            }
            .navigationTitle("Edit book")
    }
    
    func editButtonPressed() {
        listViewVodel.editItem(book: book, title: titleText, author: authorText, review: reviewText, score: scoreText, isCompleted: finished)
        presentationMode.wrappedValue.dismiss()
}
}

struct EditView_Previews: PreviewProvider {
    
    static  var book1 = ItemModel(title: "Game of thrones", author: "G. R. R. Martin", review: "", score: 0, isCompleted: false)
    
    static var previews: some View {
        NavigationView{
            EditView(book: book1, titleText: "lol", authorText: "kek", reviewText: "cheburek", scoreText: 6.5, finished: true)
        } .environmentObject(ListViewModel())
    }
}

