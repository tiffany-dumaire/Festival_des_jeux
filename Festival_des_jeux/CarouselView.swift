//
//  CarouselView.swift
//  Festival_des_jeux
//
//  Created by user184780 on 3/25/21.
//

import Foundation
import SwiftUI

struct CarouselView: View{
    
    @GestureState private var dragState = DragState.inactive
    @State var carouselLocation = 0
    
    var itemHeight: CGFloat
    var views:[AnyView]
    
    var body: some View{
        Text("Hello,World!")
    }
    
    func relativeLoc() -> Int{
            return ((views.count * 10000) + carouselLocation) % views.count
    }
    
    func getHeight(_ i:Int) -> CGFloat{
            if i == relativeLoc(){
                return itemHeight
            } else {
                return itemHeight - 100
            }
    }
    
    func getOpacity(_ i:Int) -> Double{
            
            if i == relativeLoc()
                || i + 1 == relativeLoc()
                || i - 1 == relativeLoc()
                || i + 2 == relativeLoc()
                || i - 2 == relativeLoc()
                || (i + 1) - views.count == relativeLoc()
                || (i - 1) + views.count == relativeLoc()
                || (i + 2) - views.count == relativeLoc()
                || (i - 2) + views.count == relativeLoc()
            {
                return 1
            } else {
                return 0
            }
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
            print("drag ended")
            let dragThreshold:CGFloat = 200
            if drag.predictedEndTranslation.width > dragThreshold || drag.translation.width > dragThreshold{
                carouselLocation =  carouselLocation - 1
            } else if (drag.predictedEndTranslation.width) < (-1 * dragThreshold) || (drag.translation.width) < (-1 * dragThreshold)
            {
                carouselLocation =  carouselLocation + 1
            }
        }
}

enum DragState{
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize{
        switch self{
        case .inactive:
                return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging:Bool{
        switch self{
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}


