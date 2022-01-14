//
//  NoBooksView.swift
//  owl
//
//  Created by Сергей Иванчихин on 12.01.2022.
//

import SwiftUI

struct NoBooksView: View {
    var body: some View {
        ScrollView {
            Text("Oh no!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
            Text("There is no book in your collection")
                .font(.title2)
                .padding()
            Text("I can fix this")
                .padding()
            NavigationLink(
                destination: AddView(),
                label: {
            Text("Click me")
                        .foregroundColor(.black)
                        .modifier(standartButton())
                })
                .padding(30)
        }
    }

}

struct NoBooksView_Previews: PreviewProvider {
    static var previews: some View {
        NoBooksView()
    }
}
