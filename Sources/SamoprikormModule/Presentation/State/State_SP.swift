//
//  State_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 23.02.2022.
//


struct State_SP {
    var searchFieldText = ""
    var cards = [ProductCard_SP]()
    var errorMessage = ""
    var isLoading = false
    var needToReloading = false
    
    init(cards: [ProductCard_SP]?) {
        guard let cards = cards else { return }
        self.cards = cards
    }
}
