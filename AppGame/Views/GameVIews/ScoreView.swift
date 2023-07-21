//
//  ScoreView.swift
//  AppGame
//
//  Created by Марк Горкій on 20.07.2023.
//

import SwiftUI
import CoreData

struct ScoreView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.points, order:.reverse)]) var score: FetchedResults<Score>
    var body: some View {
        List {
            ForEach(score){ score in
                    HStack(spacing: 200) {
                        Text("\(Int(score.points))").font(.title2)
                        
                        Text("\(calcTimeSince(date: score.date!))")
                    }
                    .listRowBackground(Capsule().fill(Color.purple.opacity(0.4)))
                    .lineSpacing(10)
            }
        }.edgesIgnoringSafeArea(.bottom)
        .scrollContentBackground(.hidden)
        .background {
            Image("photo1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 3)
                .overlay(Color.indigo.opacity(0.2))
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color.purple.opacity(0.5))
                            .frame(width: 100, height: 30)
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 30)
                        HStack {
                            Text("Back")
                                .fontWeight(.light)
                                .foregroundColor(.black)
                                .frame(width: 50.0, height: 30.0)
                            Image(systemName: "house")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 25.0, height: 25.0)
                        }
                    }
                })
            }
        })
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
