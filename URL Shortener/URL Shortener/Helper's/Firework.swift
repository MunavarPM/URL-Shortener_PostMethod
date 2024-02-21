//
//  Firework.swift
//  URL Shortener
//
//  Created by MUNAVAR PM on 17/02/24.
//

import SwiftUI

struct FireworkParticle: View {
    @State private var offset: CGSize = .zero
    @State private var opacity: Double = 1.0
    
    let colors: [Color] = [.red.opacity(0.5), .orange.opacity(0.5), .yellow.opacity(0.5), .green.opacity(0.5), .blue.opacity(0.5), .purple.opacity(0.5)]
    
    var body: some View {
        Circle()
            .fill(colors.randomElement() ?? .white)
            .frame(width: 10, height: 10)
            .offset(offset)
            .opacity(opacity)
            .onAppear {
                withAnimation(Animation.easeOut(duration: 12)) {
                    offset = CGSize(width: CGFloat.random(in: -100...100), height: CGFloat.random(in: -100...100))
                    opacity = 0.0
                }
            }
    }
}
struct FireworksView: View {
    var body: some View {
        VStack {
            ForEach(0..<15){_ in
                HStack{
                    ForEach(0..<7) { _ in
                        FireworkParticle()
                            .padding()
                    }
                }
            }
            
        }
    }
}
