//
//  ScoreView.swift
//  AppGame
//
//  Created by Марк Горкій on 20.07.2023.
//

import SwiftUI
import CoreData

struct ScoreView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.points, order:.reverse)]) var score: FetchedResults<Score>
    var body: some View {
        List {
            ForEach(score){ score in
                HStack(spacing: 200) {
                    Text("\(Int(score.points))").font(.title2)
                    
                    Text("\(calcTimeSince(date: score.date!))")
                }
            }.listRowSeparatorTint(.white)
                .listRowBackground(Image("photo1"))
        }
    }
}


struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
