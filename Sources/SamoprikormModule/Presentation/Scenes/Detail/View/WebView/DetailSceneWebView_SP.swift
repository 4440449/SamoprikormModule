//
//  DetailSceneWebView_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 05.06.2022.
//

import SwiftUI
import WebKit

// MARK: - WKWebView

final class DetailWKWebView_SP: WKWebView,
                                ObservableObject {
    
    // MARK: - Init
    init(frame: CGRect,
         configuration: WKWebViewConfiguration,
         navigationDelegate: WKNavigationDelegate?,
         uiDelegate: WKUIDelegate?) {
        super.init(frame: frame, configuration: configuration)
        self.navigationDelegate = navigationDelegate
        self.uiDelegate = uiDelegate
        self.isOpaque = false
        self.backgroundColor = .clear
        self.scrollView.backgroundColor = .clear
        self.addObserver(self,
                         forKeyPath: #keyPath(WKWebView.isLoading),
                         options: .new,
                         context: nil)
//        print("DetailSceneWebView init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - State
    @Published var loadingState = false
    
    
    // MARK: - KVO isLoading state
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let keyPath = keyPath else { return }
        if keyPath == "loading" {
            loadingState = self.isLoading
        }
    }
    
    deinit {
//        print("DetailSceneWebView DEINIT")
    }
    
}



// MARK: - SwiftUI Representable

struct DetailSceneWebView_SP: UIViewRepresentable {
    
    private let urlEndPoint: String
    private let wkWebWiev: WKWebView
    
    init(urlEndPoint: String,
         wkWebWiev: WKWebView) {
        self.urlEndPoint = urlEndPoint
        self.wkWebWiev = wkWebWiev
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return wkWebWiev
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        if let requestUrl = URL(string: "https://mterpugova.notion.site/\(urlEndPoint)") {
            webView.load(URLRequest(url: requestUrl))
        }
    }
    
}
