//
//  DetailSceneConfigurator_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 05.06.2022.
//

import SwiftUI
import WebKit

private let webViewDelegate = DetailSceneWebViewDelegate_SP()
private let detailWebView = DetailWKWebView_SP(frame: .zero,
                                             configuration: WKWebViewConfiguration(),
                                             navigationDelegate: webViewDelegate,
                                             uiDelegate: webViewDelegate)

struct DetailSceneConfigurator_SP {
    static func configure(card: ProductCard_SP) -> some View {
        return DetailScene_SP(card: card,
                              wkWebView: detailWebView)
    }
}
