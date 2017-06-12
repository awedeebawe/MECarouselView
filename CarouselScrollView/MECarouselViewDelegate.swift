//
//  MECarouselViewDelegate.swift
//  CarouselScrollView
//
//  Created by Gabriel Bezerra Valério on 12/06/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

@objc public protocol MECarouselViewDelegate : class {
    
    @objc optional func carouselView(_ carouselView:MECarouselView, willSnapTo index:Int)
    @objc optional func carouselView(_ carouselView:MECarouselView, DidSnapTo index:Int)
    
}
