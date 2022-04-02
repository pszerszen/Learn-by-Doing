//
//  ContentView.swift
//  Learn by Doing
//
//  Created by Piotr Szerszeń on 02/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20.0) {
                ForEach(cardData) { item in
                    CardView(card: item)
                }
            }
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
