//
//  ContentView.swift
//  AppGame
//
//  Created by Марк Горкій on 19.07.2023.
//

import SwiftUI
import CoreData
import WebKit

struct ContentView: View {
    
    
    @State private var showLoading: Bool = false
    @State private var loadedLink: String? = nil
    @State private var showMenu: Bool = false
    var body: some View {
        content
    }
    
    var content: some View {
        ZStack {
           Text("loading...")
                .onAppear {
                    getLink { result in
                        switch result {
                        case .success(let link):
                            if link.access == true {
                                loadedLink = link.link
                                print (link.access)
                            } else {
                                showMenu.toggle()
                            }
                        case .failure(let error):
                            print("Помилка отримання конфігурації: \(error)")
                        }
                    }
                }
            if !showMenu {
                if let link = loadedLink {
                    WebView(url: URL(string: link)!, ShowLoading: $showLoading)
                        .overlay(showLoading ? ProgressView("Loading...") : nil)
                }
            } else {
                MenuView()
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
