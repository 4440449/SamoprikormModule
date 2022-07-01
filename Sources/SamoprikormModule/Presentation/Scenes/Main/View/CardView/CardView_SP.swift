//
//  CardView_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 18.06.2022.
//

import SwiftUI

struct CardView_SP: View {
    
    //MARK: - Dependencies
    private let productCard: ProductCard_SP
    private let actionPool: ActionPool_SP
    
    //MARK: - Init
    
    init(product: ProductCard_SP,
         actionPool: ActionPool_SP) {
        self.productCard = product
        self.actionPool = actionPool
        actionPool.dispatch(params: .imageLoading(product))
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 0) {
                //                Image(productCard.imagePath!, bundle: nil)
                //                    .resizable()
                ZStack {
                    Image(uiImage: productCard.image ?? UIImage())
                        .resizable()
                    if productCard.imageIsLoading {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .scaleEffect(1.3)
                    }
                }
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(productCard.title)
                            .title()
                        HStack(spacing: 40) {
                            VStack(alignment: .leading) {
                                Text(productCard.age)
                                    .title2()
                                Text("месяцев")
                                    .callout()
                            }
                            VStack(alignment: .leading) {
                                Text(productCard.allergen)
                                    .title2()
                                Text("аллерген")
                                    .callout()
                            }
                            VStack(alignment: .leading) {
                                Text(productCard.rating)
                                    .title2()
                                Text("польза")
                                    .callout()
                            }
                        }
                    }
                    .padding(.init(top: 13, leading: 16, bottom: 20, trailing: 0))
                    Spacer()
                }
                .background(Color("cardFill3", bundle: nil))
            }
            .cornerRadius(14)
        }
        .frame(height: UIScreen.main.bounds.height * 0.485)
        .padding(.all, 2)
        .background(Color("cardBorderSystemColor3", bundle: nil))
        .cornerRadius(15)
        .padding(.horizontal, 16)
        .shadow(color: Color("cardShadowUp", bundle: nil),
                radius: 6, x: -3, y: -7)
        .shadow(color: Color("cardShadowDown", bundle: nil),
                radius: 6, x: 5, y: 5)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainSceneConfigurator_SP.configure()
        //            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}
