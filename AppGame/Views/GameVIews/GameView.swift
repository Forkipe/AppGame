//
//  GameView.swift
//  AppGame
//
//  Created by Марк Горкій on 20.07.2023.
//

import Foundation
import SwiftUI

struct GameView : View {
    @State private var HeliPosition = CGPoint(x: 100, y: 100)
    @State private var score: Double  = 0
    @State private var ObstPosition = CGPoint(x: 1000, y: 300)
    @State private var isPaused:Bool  = false
    @State private var speed:Int = 0
    @Environment(\.managedObjectContext) var managedObjContext
    
    
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                Helicopter()
                    .position(self.HeliPosition)
                    .onReceive(self.timer) {_ in
                        self.gravity()
                    }
                
                Obstacle()
                    .position(self.ObstPosition)
                    .onReceive(self.timer) { _ in
                        self.obstMove(a:self.speed)
                    }
                Text("Score:\(Int(self.score))")
                    .foregroundColor(.white)
                    .position(x: geo.size.width - 100, y: geo.size.height/10)
                self.isPaused ? Button (action: { self.resume()}, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 3)
                            .foregroundColor(.gray)
                            .frame(width: 136, height: 41)
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.black)
                            .frame(width: 135, height: 40)
                        Text("RESTART")
                            .font(.title)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.white)
                    }
                })  : nil
                
                Button( action: {
                    withAnimation {
                        self.HeliPosition.y -= 120
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 3)
                            .foregroundColor(.gray)
                            .frame(width: 80, height: 40)
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.black)
                            .frame(width: 80, height: 40)
                        Text("FLY")
                            .font(.title)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.white)
                    }
                }).position(x: 750, y: 350)
            }
            .onReceive(self.timer) {
                _ in self.collisionDetection();
                self.score += 0.1
                self.speed += 1
            }
            .background(Image("nightsky"))
            .frame(width: geo.size.width, height: geo.size.height)
        }.onAppear{
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
            AppDelegate.orientationLock = .landscapeLeft
        }.onDisappear{
            AppDelegate.orientationLock = .all
        }
        .ignoresSafeArea(.all)
    }
    
    func gravity() {
        withAnimation {
            self.HeliPosition.y += 20
        }
    }
    
    func obstMove(a:Int) {
        let infinityValue:Int = Int.max
        if self.ObstPosition.x > 0 {
            switch a {
            case 0...300:
                withAnimation {
                    self.ObstPosition.x -= 20
                }
            case 300...600:
                withAnimation {
                    self.ObstPosition.x -= 22
                }
            case 600...900:
                withAnimation {
                    self.ObstPosition.x -= 24
                }
            case 900...1200:
                withAnimation {
                    self.ObstPosition.x -= 26
                }
            case 1200...infinityValue:
                withAnimation {
                    self.ObstPosition.x -= 28
                }
            default:
                print(a)
            }

        } else {
            self.ObstPosition.x = 1000
            self.ObstPosition.y = CGFloat.random(in: 0...500)
        }
    }
    
    func pause() {
        self.timer.upstream.connect().cancel()
        DataController().AddItem(score: score, context: managedObjContext)
    }
    
    func resume() {
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        self.ObstPosition.x = 1000
        self.HeliPosition = CGPoint(x: 100, y: 100)
        self.isPaused = false
        self.score = 0
        self.speed = 0
    }
    
    func collisionDetection() {
        let screenBounds = UIScreen.main.bounds
        if abs(HeliPosition.x - ObstPosition.x) < (25 + 10) && abs(HeliPosition.y - ObstPosition.y) < (25 + 100) || !screenBounds.contains(self.HeliPosition)  {
            self.pause()
            self.isPaused = true
        }
    }
    
}

