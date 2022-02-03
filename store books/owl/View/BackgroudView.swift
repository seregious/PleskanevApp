//
//  BackgroudView.swift
//  owl
//
//  Created by Сергей Иванчихин on 11.01.2022.
//

import SwiftUI

//   init () {
//       UITableView.appearance().backgroundColor = .clear
//       UITableViewCell.appearance().backgroundColor = .clear
//   }


struct BackgroundView: View {
    
    @State  var animateGradient = false
    let colors = [Color("neonRed"), Color("neonTeal"), Color("neonGreen"), Color("lightBlue"),Color("neonRed"), Color("lightRed")]
    
    var body: some View {
        LinearGradient(colors: colors, startPoint: animateGradient ? .topLeading : .bottomLeading, endPoint: animateGradient ? .bottomTrailing : .topTrailing)
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.linear(duration: 5.0).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
    }
}

struct BackgroudView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(animateGradient: false)
    }
}
