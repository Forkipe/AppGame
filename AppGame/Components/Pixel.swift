//
//  Pixel.swift
//  AppGame
//
//  Created by Марк Горкій on 20.07.2023.
//

import Foundation
import SwiftUI

struct Pixel: View {
    let size: CGFloat
    let color: Color
    
    
    var body: some View{
        Rectangle()
            .frame(width: size, height: size)
    }
}
