//
//  Helicopter.swift
//  AppGame
//
//  Created by Марк Горкій on 20.07.2023.
//

import Foundation
import SwiftUI

struct Helicopter: View {
    let rows = 5
    let columns = 5
    let size:CGFloat = 10
    let heliBlocks: [[Color]] = [[.clear, .clear, .white, .clear, .clear],
                                 [.orange, .clear, .white, .white, .clear],
                                 [.clear, .white, .white, .blue, .gray],
                                 [.orange, .clear, .white, .white, .clear],
                                 [.clear, .clear, .white, .clear, .clear]]
    var body: some View {
        VStack(spacing: 0) {
            ForEach((0...rows - 1), id: \.self) {row in
                HStack(spacing: 0){
                    ForEach((0...self.columns - 1), id: \.self) {col in
                        VStack(spacing: 0) {
                            Rectangle().foregroundColor(self.heliBlocks[row][col])
                                .frame(width: self.size, height: self.size)
                        }
                    }
                }
            }
        }
    }
}
