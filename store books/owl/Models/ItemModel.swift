//
//  File.swift
//  owl
//
//  Created by Сергей Иванчихин on 11.01.2022.
//

import Foundation
import SwiftUI

struct ItemModel : Identifiable, Codable {
    let id : String
    let title : String
    let author : String
    let review : String
    var score : Double //= 0
    var color : Color {
        var color = Color.black
        switch score {
        case 7...10 : color = Color.green
        case 4...6 : color = Color.yellow
        case 1...3 : color = Color.red
        default: break
        }
        return color
    }
    
    var label : String {
        var label = "circle"
        for i in 1...10 {
            if Int(score) == i {
                label = String(i) + ".circle.fill"
            }
        }
        return label
    }
    
    var isCompleted : Bool {
        score > 0 ? true : false
    }
    
    init (id: String = UUID().uuidString, title: String, author: String, review: String, score: Double, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.author = author
        self.review = review
        self.score = score
        //self.isCompleted = isCompleted
    }
    
    func updateComplete() -> ItemModel {
        return ItemModel(id: id, title: title, author: author, review: review, score: score, isCompleted: !isCompleted)
    }
    
    func editItem (newTitle: String, newAuthor: String, newReview: String, newScore: Double, isCompleted: Bool) -> ItemModel {
        return ItemModel(id: id, title: newTitle, author: newAuthor, review: newReview, score: newScore, isCompleted: isCompleted)
    }
}

