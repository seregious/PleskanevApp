//
//  ContentView.swift
//  owl
//
//  Created by Сергей Иванчихин on 13.01.2022.
//

import SwiftUI

struct Neon: ViewModifier {
    func body(content: Content) -> some View {
        content
            //.foregroundColor(Color.white)
            .shadow(color: .white, radius: 10)
            .font(.title)
            
    }
}

struct button: ViewModifier {
    var animate : Bool
    func body(content: Content) -> some View {
        content
            .padding(animate ? 10 : 20)
            .background(animate ? .red : .blue)
            .cornerRadius(20)
            
    }
}

struct buttonShadow: ViewModifier {
    var animate : Bool
    func body(content: Content) -> some View {
        content
            .shadow(color: animate ? Color("lightBlue") : Color("lightRed"), radius: 10, x: 10, y: 10)
            .scaleEffect(animate ? 1.5 : 1)
            
    }
}

struct standartButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.title3)
            .frame(width: 200)
            .background(.ultraThickMaterial)
            .cornerRadius(30)
    }
}

struct ContentView: View {
    
    var body: some View {
Text("Hi")
            .modifier(Neon())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

