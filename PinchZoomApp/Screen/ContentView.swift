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
    @State var imageOffset: CGSize = .zero
    
    // MARK: - FUNCTION
    func resetImage() -> Void {
        withAnimation(.spring()){
            imageOffset = .zero
            imageScale = 1
        }
    }
    // MARK: - CONTENT
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.clear
                
                // MARK: - PAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .offset(x: imageOffset.width, y: imageOffset.height)
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
                // MARK: - DRAG GESTURE
                    .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                withAnimation(.linear(duration: 1)){
                                    if imageOffset.width <= UIScreen.main.bounds.width && imageOffset.height <= UIScreen.main.bounds.height {
                                        imageOffset = gesture.translation
                                    }
                                }
                            })
                            .onEnded({ _ in
                                    resetImage()
                            })
                    )
                    
                
            }//: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                isAnimating.toggle()
            })
            
            // MARK: - INFO PANEL
            .overlay(
                InfoPanelView(offset: imageOffset, scale: imageScale)
                    .padding(.horizontal)
                    .padding(.top, 30)
                , alignment: .top
            )
            
            // MARK: - CONTROL PANEL
            .overlay(
                Group{
                    HStack{
                        // SCALE MINUS
                        Button(action: {
                            if imageScale >= 1 && imageScale < 5 {
                                withAnimation(.spring()){
                                    imageScale += 1
                                }
                            }
                        }){
                            ButtonsView(iconName: "plus.magnifyingglass")
                        }
                        
                        // RESET
                        Button(action: {
                            resetImage()
                        }){
                            ButtonsView(iconName: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        //SCALE PLUS
                        Button(action: {
                            if imageScale > 1 && imageScale < 5 {
                                withAnimation(.spring()){
                                    imageScale -= 1
                                }
                            }
                        }){
                            ButtonsView(iconName: "minus.magnifyingglass")
                        }
                        
                    }
                }
                ,alignment: .bottom
            )
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
