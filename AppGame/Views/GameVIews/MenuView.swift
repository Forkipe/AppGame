//
//  GameView.swift
//  AppGame
//
//  Created by Марк Горкій on 19.07.2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("photo1")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                NavigationLink(destination: ScoreView()) {
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 10)
                            .opacity(0.5)
                            .frame(width: 209, height: 39)
                            .foregroundColor(.gray)
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                            .foregroundColor(.white)
                            .frame(width: 210, height: 40)
                        Text("Highscores")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        
                    }
                }.position(x:200, y:700)
            VStack(alignment: .center, spacing: 100.0) {
                NavigationLink(destination: GameView()) {
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 259, height: 59)
                            .foregroundColor(.blue)
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                            .foregroundColor(.white)
                            .frame(width: 260, height: 60)
                        Text("PLAY")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                        
                    }
                }
                
                NavigationLink(destination: RulesView()) {
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 249, height: 49)
                            .foregroundColor(.teal)
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                            .foregroundColor(.white)
                            .frame(width: 250, height: 50)
                        Text("RULES")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                        
                    }
                }
                
                NavigationLink(destination: AboutView()) {
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 249, height: 49)
                            .foregroundColor(.teal)
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                            .foregroundColor(.white)
                            .frame(width: 250, height: 50)
                        Text("ABOUT")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                        
                    }
                }
                
                
            }
            }
           
        }.onAppear{
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            AppDelegate.orientationLock = .portrait
        }.onDisappear{
            AppDelegate.orientationLock = .all
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
