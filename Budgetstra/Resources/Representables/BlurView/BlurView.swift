//
//  BlurView.swift
//  Budgetstra
//
//  Created by Seun Olalekan on 2021-12-10.
//

import Foundation
import SwiftUI

struct BlurView : UIViewRepresentable {
   
    let style : UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
          
      }
    
    
}

