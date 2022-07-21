//
//  ProductCardNetworkEntity_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 09.06.2022.
//

import BabyNet
import Foundation


protocol DomainConvertable {
    associatedtype DomainEntity
    func parseToDomain() throws -> DomainEntity
}

struct ProductCardNetworkEntity_SP: Decodable, DomainConvertable {
    
    let id: String
    let createdAt: String
    let title: String
    let imagePath: String
    let allergen: String
    let age: String
    let rating: String
    
    enum CodingKeys: CodingKey {
        case id
        case created_at
        case title
        case imagePath
        case allergen
        case age
        case rating
    }
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.decode(String.self, forKey: .id)
            self.createdAt = try container.decode(String.self, forKey: .created_at)
            self.title = try container.decode(String.self, forKey: .title)
            self.imagePath = try container.decode(String.self, forKey: .imagePath)
            self.allergen = try container.decode(String.self, forKey: .allergen)
            self.age = try container.decode(String.self, forKey: .age)
            self.rating = try container.decode(String.self, forKey: .rating)
    }
    
//     DomainConvertable
       func parseToDomain() -> ProductCard_SP {
           return .init(id: self.id,
                        title: self.title,
                        imagePath: self.imagePath,
                        allergen: self.allergen,
                        age: self.age,
                        rating: self.rating)
       }
}

