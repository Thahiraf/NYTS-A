//
//  BannerView.swift
//  NYTS
//
//  Created by Thahi on 11/07/2021.
//

import Foundation
import SwiftUI

struct BannerView:View {
private var numImages = 5
private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
@State private var currentIndex = 0


var body: some View {
    GeometryReader{ proxy in
        TabView(selection: $currentIndex){
                            ForEach(0..<numImages) { num in
                                Image("\(num)")
                                    .resizable()
                                    .scaledToFill()
                                    .tag(num)
                            }
                        
        }.tabViewStyle(PageTabViewStyle())
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/))
        .padding()
        .frame(width: proxy.size.width, height: proxy.size.height)
        .onReceive(timer, perform: { _ in
            withAnimation{
                
                currentIndex = currentIndex < numImages ? currentIndex + 1 : 0
            }
        })
    }
}

}
