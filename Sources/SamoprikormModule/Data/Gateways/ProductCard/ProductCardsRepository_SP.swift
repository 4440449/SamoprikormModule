//
//  ProductCardsRepository_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 09.06.2022.
//

import Foundation


final class ProductCardsRepository_SP: ProductCardGateway_SP {
    
    let network: ProductCardsNetworkRepositoryProtocol_SP
    
    init(network: ProductCardsNetworkRepositoryProtocol_SP) {
        self.network = network
    }
    
    func fetch() async throws -> [ProductCard_SP] {
        return try await withCheckedThrowingContinuation({ continuation in
            let _ = network.fetch { result in
                switch result {
                case let .success(cards):
                    let domain = cards.map { $0.parseToDomain() }
                    continuation.resume(returning: domain)
                    
                case let .failure(error): continuation.resume(throwing: error)
                }
            }
        })
    }
    
    func fetchImage(for card: ProductCard_SP) async throws -> Data {
        try await withCheckedThrowingContinuation({ continuation in
            let _ = network.fetchImage(for: card) { result in
                switch result {
                case let .success(image): continuation.resume(returning: image)
                case let .failure(error): continuation.resume(throwing: error)
                }
            }
        })
    }
}
