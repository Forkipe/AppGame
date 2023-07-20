//
//  Obstacle.swift
//  AppGame
//
//  Created by Марк Горкій on 20.07.2023.
//

import Foundation
import SwiftUI

struct Obstacle: View {
    let width: CGFloat = 20
    let height: CGFloat = 200
    
    var body: some View{
        Rectangle()
            .foregroundColor(.green)
            .frame(width: width, height: height)
    }
}
