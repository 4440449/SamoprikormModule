//
//  MainSceneConfigurator_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 05.06.2022.
//

import SwiftUI
import BabyNet


public struct MainSceneConfigurator_SP {
    
    public static func configure() -> some View {
        let reducer = Reducer_SP()
        let storeGlobal = Store_SP(initialState: nil, reducer: reducer)
        let client = BabyNetRepository()
        let apiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNydXZtZ3V1YWRyaWt4amdscml3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTQ3ODgyMzgsImV4cCI6MTk3MDM2NDIzOH0.udc8nAU84lOWCgJChCCq815w0oBoXh6zrceObzg8Z1Q"
        let network = ProductCardsNetworkRepository_SP(client: client, apiKey: apiKey)
        let repository = ProductCardsRepository_SP(network: network)
        let errorHandler = ErrorHandler_SP()
        let actionPool = ActionPool_SP(store: storeGlobal, productCardRepository: repository, errorHandler: errorHandler)
        let view = MainSceneView_SP(store: storeGlobal,
                                    actionPool: actionPool)
        let navigationView = MainSceneNavigationView_SP(contentView: view,
                                                        actionPool: actionPool)
        return navigationView.ignoresSafeArea()
//        return MainSceneView_SP(store: storeGlobal,
//                                actionPool: actionPool)
    }
}
