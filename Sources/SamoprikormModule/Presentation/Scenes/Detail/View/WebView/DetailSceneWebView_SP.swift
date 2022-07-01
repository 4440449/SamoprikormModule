//
//  DetailSceneWebView_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 05.06.2022.
//

import SwiftUI
import WebKit

// MARK: - WKWebView

final class DetailWKWebView_SP: WKWebView, ObservableObject {
    
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
                         options:.new,
                         context: nil)
        print("DetailSceneWebView INIT")
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
        print("DetailSceneWebView DEINIT")
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
        print("DetailSceneWebView_SP init")
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return wkWebWiev
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        print("https://mterpugova.notion.site/\(urlEndPoint)")
        if let requestUrl = URL(string: "https://mterpugova.notion.site/\(urlEndPoint)") {
            webView.load(URLRequest(url: requestUrl))
        }
    }
}






//final class WebCacheCleaner {
//
//    class func clean() {
////        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
////        print("[WebCacheCleaner] All cookies deleted")
//
//        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
//            records.forEach { record in
//                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
//                print("[WebCacheCleaner] Record \(record) deleted")
//            }
//        }
//    }
//
//}
