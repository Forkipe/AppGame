//
//  AboutView.swift
//  AppGame
//
//  Created by Марк Горкій on 20.07.2023.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Image("moon_waterfall")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                RoundedRectangle(cornerRadius: 30)
                    .stroke(lineWidth: 5)
                    .frame(width: 120.0, height: 50)
                    
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .opacity(0.4)
                        .foregroundColor(.white)
                        .frame(width: 119.0, height: 49.0))
                    .offset(y:-200)
                    .overlay(Text("About")
                        .offset(y:-200)
                        .fontWeight(.heavy)
                        .font(.title))
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 3)
                        .frame(width: 300, height: 250)
                        .foregroundColor(.black)
                    RoundedRectangle(cornerRadius: 10).opacity(0.4)
                        .frame(width: 300, height: 250)
                        .foregroundColor(.white)
                        .overlay(
                            Text("The goal of this game is to fly over alien lasers and survive as long as you can to score more points, unfortunately you may encounter some bugs, sorry for that)")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .multilineTextAlignment(.center))
                }
                .onAppear{
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                    AppDelegate.orientationLock = .portrait
                }.onDisappear{
                    AppDelegate.orientationLock = .all
                }
            }
        }.navigationBarBackButtonHidden(true)
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

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
