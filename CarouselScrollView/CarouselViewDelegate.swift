//
//  CarouselViewDelegate.swift
//  CarouselScrollView
//
//  Created by Gabriel Bezerra Valério on 12/06/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

@objc public protocol CarouselViewDelegate : class {
    
    @objc optional func carouselView(_ carouselView:CarouselView, willSnapTo index:Int)
    @objc optional func carouselView(_ carouselView:CarouselView, DidSnapTo index:Int)
    
}
