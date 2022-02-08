//
//  InfoPanelView.swift
//  PinchZoomApp
//
//  Created by Samed Semih Sürmeli on 8.02.2022.
//

import SwiftUI

struct InfoPanelView: View {
    var offset: CGSize
    var scale: CGFloat
    
    @State var isInfoPanelVisible: Bool = true
    
    var body: some View {
        // MARK: - HOTSPOT
        
        HStack{
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1, perform: {
                    withAnimation(.easeOut(duration: 0.2)){
                        isInfoPanelVisible.toggle()
                    }
                })
            Spacer()
            
            // MARK: - INFO PANEL
            HStack(spacing: 2){
                Image(systemName: "arrow.up.left.and.arrow.down.right.circle")
                    .symbolRenderingMode(.hierarchical)
                    .font(.system(size: 20))
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right.circle")
                    .symbolRenderingMode(.hierarchical)
                    .font(.system(size: 20))
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down.circle")
                    .symbolRenderingMode(.hierarchical)
                    .font(.system(size: 20))
                Text("\(offset.height)")
                
                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1 : 0)
            
            Spacer()
        }
    }
}

// MARK: - PREVIEW

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(offset: .zero, scale: 1)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
