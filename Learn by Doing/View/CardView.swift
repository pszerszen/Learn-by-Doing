//
//  CardView.swift
//  Learn by Doing
//
//  Created by Piotr Szerszeń on 02/04/2022.
//

import SwiftUI

struct CardView: View {
    
    private let card: Card
    
    private var gradientColors: [Color] {
        return card.gradientColors
    }
    
    @State private var fadeIn = false
    @State private var moveDownward = false
    @State private var moveUpward = false
    @State private var showAlert = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    init(card: Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
            
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Text(card.headLine)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
            }
            .offset(y: moveDownward ? -218 : -300)
            
            Button {
                playSound()
                self.hapticImpact.impactOccurred()
                self.showAlert.toggle()
            } label: {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .accentColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(.white)
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: gradientColors),
                        startPoint: .leading,
                        endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }
            .offset(y: moveUpward ? /*@START_MENU_TOKEN@*/210.0/*@END_MENU_TOKEN@*/ : 300.0)
            
        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                self.fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                self.moveDownward.toggle()
                self.moveUpward.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(card.title),
                  message: Text(card.message),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(cardData) { item in
            CardView(card: item)
                .previewLayout(.sizeThatFits)
        }
    }
}
