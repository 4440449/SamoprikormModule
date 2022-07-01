//
//  DetailScene_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 03.06.2022.
//

import SwiftUI


struct DetailScene_SP: View {
    
    private let card: ProductCard_SP
    @ObservedObject private var wkWebView: DetailWKWebView_SP
    
    init(card: ProductCard_SP,
         wkWebView: DetailWKWebView_SP) {
        self.card = card
        self.wkWebView = wkWebView
    }
    
    var body: some View {
        ZStack {
            DetailSceneWebView_SP(urlEndPoint: card.id,
                                  wkWebWiev: wkWebView)
            if wkWebView.loadingState {
                Color("WebViewLoadingBackgroundColor", bundle: nil)
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height,
                           alignment: .center)
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(1.3)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitleDisplayMode(.inline)
    }
}



//MARK: - Preview

//struct DetailScene_SP_Previews: PreviewProvider {
//
//    static var previews: some View {
//        DetailSceneConfigurator_SP.configure(card: testCards[0])
//    }
//}
