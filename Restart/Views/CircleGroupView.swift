//
//  CircleGroupView.swift
//  Restart
//
//  Created by MAC on 17/06/22.
//

import SwiftUI

struct CircleGroupView: View {
    //MARK: Property
    
    @State  var shapeColor: Color
    @State var shapeOppacity: Double
    @State private var isAnimating: Bool = false
    
    
    //MARK: Body
    var body: some View {
        ZStack {
        Circle()
                .stroke(shapeColor.opacity(shapeOppacity), lineWidth: 40) //Make Ring
                .frame(width: 260, height: 260, alignment: .center)

        Circle()
                    .stroke(shapeColor.opacity(shapeOppacity), lineWidth: 80) //Make Circle
                    .frame(width: 260, height: 260, alignment: .center)
                    
        }//ZSTACK
                   .blur(radius: isAnimating ? 0 : 10)
                   .opacity(isAnimating ? 1 : 0)
                   .scaleEffect(isAnimating ? 1 : 0.5)
                   .animation(.easeOut(duration: 1), value: isAnimating)
                   .onAppear(perform: {
                       isAnimating = true
                   })
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            CircleGroupView(shapeColor: .white, shapeOppacity: 0.2)
        }
    }
}
