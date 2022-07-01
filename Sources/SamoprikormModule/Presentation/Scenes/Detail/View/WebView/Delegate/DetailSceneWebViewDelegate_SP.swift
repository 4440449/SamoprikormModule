//
//  DetailSceneWebViewDelegate_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 05.06.2022.
//

import WebKit


final class DetailSceneWebViewDelegate_SP: NSObject, WKNavigationDelegate, WKUIDelegate {
    
    override init() {
        print("init WebViewDelegate_SP")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        let url = navigationAction.request.url
        if (url != nil && url!.absoluteString.contains("mterpugova")) {
            return .allow
        } else {
            return .cancel
        }
    }
    
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        print("loaded")
//    }
    
    deinit {
        print("deinit WebViewDelegate_SP")
    }
}
