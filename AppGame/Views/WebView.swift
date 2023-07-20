//
//  WebView.swift
//  AppGame
//
//  Created by Марк Горкій on 19.07.2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{
    let url: URL
    @Binding var ShowLoading: Bool
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        webView.navigationDelegate=context.coordinator
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    func makeCoordinator() -> Coordinator  {
        Coordinator(didStart: {
            ShowLoading = true
        }, didFinish: {
             ShowLoading = false
        })
    }
    
}

class Coordinator: NSObject, WKNavigationDelegate{
    var didStart: () -> Void
    var didFinish: () -> Void
    
    init(didStart: @escaping () -> Void = {}, didFinish: @escaping () -> Void = {}) {
        self.didStart = didStart
        self.didFinish = didFinish
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        didStart()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinish()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print ("Error")
    }
     
}
