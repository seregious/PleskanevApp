//
//  FilmView.swift
//  owl
//
//  Created by Сергей Иванчихин on 15.01.2022.
//

import SwiftUI

struct FilmView: View {
    
    @State var animate = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            NavigationLink(
                destination: AddView(),
                label: {
            Text("Work in progress!!!")
                        .foregroundColor(.white)
                        .modifier(button(animate: animate))
                })
                .padding(30)
                .modifier(buttonShadow(animate: animate))
                .modifier(Neon())
        } .onAppear(perform: buttonAnimation)

    }
    
    func buttonAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView()
    }
}
