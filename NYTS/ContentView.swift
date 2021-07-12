//
//  ContentView.swift
//  NYTS
//
//  Created by Thahi on 08/07/2021.
//

import SwiftUI

struct ContentView: View {
    private var numberofImages = 5
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
       
        
        //Image("diamond").aspectRatio(contentMode: .fit)
//        GeometryReader{ proxy in
//        TabView{
//            ForEach(0..<numberofImages){ num in
//                Image("\(num)")
//                    .resizable()
//                    .scaledToFill()
//                    .tag(num)
//            }
//        }.tabViewStyle(PageTabViewStyle())
//        .frame(width: proxy.size.width, height: proxy.size.height / 3)
//
//        }
        SearchBar()
        HStack{
        BannerView()
        }
        
        VStack {
            
            
        NavigationView{
            List(networkManager.posts){ post in
                HStack {
                    Text(post.title)
                   
                }
                
            }
        .navigationTitle("")
        }
        .onAppear(){
            self.networkManager .fetchData()
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
