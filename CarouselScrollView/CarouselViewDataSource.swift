//
//  CarouselViewDataSource.swift
//  CarouselScrollView
//
//  Created by Gabriel Bezerra Valério on 12/06/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

@objc public protocol CarouselViewDataSource : class {
 
    func numberOfViewsInCarouselView(_ carouselView:CarouselView) -> Int
    func carouselView(_ carouselView:CarouselView, viewForIndex index:Int) -> UIView
    func standardItemWidthMultiplierInCarouselView(_ carouselView:CarouselView) -> CGFloat
    @objc optional func isScrollAvaliableInCarouselView(_ carouselView:CarouselView) -> Bool
    @objc optional func standardItemScaleInCarouselView(_ carouselView:CarouselView) -> CGFloat
    @objc optional func standardTopInsetInCarouselView(_ carouselView:CarouselView) -> CGFloat
    @objc optional func standardBottomInsetInCarouselView(_ carouselView:CarouselView) -> CGFloat
    
}
