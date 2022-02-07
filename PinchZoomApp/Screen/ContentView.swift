//
//  ContentView.swift
//  PinchZoomApp
//
//  Created by Samed Semih Sürmeli on 7.02.2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    @State var isAnimating: Bool = false
    @State var imageScale: CGFloat = 1
    
    // MARK: - FUNCTION
    
    // MARK: - CONTENT
    
    var body: some View {
        NavigationView{
            ZStack{
                // MARK: - PAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    //.padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .scaleEffect(imageScale)
                // MARK: - TAP GESTURE
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()){
                                imageScale = 5
                            }
                        }else{
                            withAnimation(.spring()){
                                imageScale = 1
                            }
                        }
                    })
                    
                
            }//: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                isAnimating.toggle()
            })
        }//: NAVIGATION
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
    }
}
