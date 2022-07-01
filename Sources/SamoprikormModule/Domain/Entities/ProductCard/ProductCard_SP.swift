//
//  ProductCard.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 22.02.2022.
//

import Foundation
import UIKit


struct ProductCard_SP: Identifiable {
    let id: String
    let title: String
    let imagePath: String?
    let allergen: String
    let age: String
    let rating: String
    var image: UIImage?
    var imageIsLoading: Bool = false
}
