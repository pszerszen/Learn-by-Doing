//
//  CardModel.swift
//  Learn by Doing
//
//  Created by Piotr Szerszeń on 02/04/2022.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    
    var title: String
    var headLine: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
