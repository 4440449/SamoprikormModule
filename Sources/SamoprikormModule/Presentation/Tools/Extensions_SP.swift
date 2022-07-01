//
//  Extensions.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 03.06.2022.
//

import SwiftUI


extension Text {
    
    func title() -> some View {
        self.font(.custom("Montserrat-ExtraBold",
                          size: 28,
                          relativeTo: .title))
    }
    func title2() -> some View {
        self.font(.custom("Montserrat-Bold",
                          size: 16,
                          relativeTo: .title2))
    }
    func body() -> some View {
        self.font(.custom("Montserrat-Black",
                          size: 16,
                          relativeTo: .body))
    }
    func callout() -> some View {
        self.font(.custom("Montserrat-Regular",
                          size: 12,
                          relativeTo: .callout))
    }
}
