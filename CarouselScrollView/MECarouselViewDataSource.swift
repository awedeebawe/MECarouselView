//
//  MECarouselViewDataSource.swift
//  CarouselScrollView
//
//  Created by Gabriel Bezerra Valério on 12/06/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

@objc public protocol MECarouselViewDataSource : class {
 
    func numberOfViewsInMECarouselView(_ carouselView:MECarouselView) -> Int
    func carouselView(_ carouselView:MECarouselView, viewForIndex index:Int) -> UIView
    func standardItemWidthMultiplierInMECarouselView(_ carouselView:MECarouselView) -> CGFloat
    @objc optional func isScrollAvaliableInMECarouselView(_ carouselView:MECarouselView) -> Bool
    @objc optional func standardItemScaleInMECarouselView(_ carouselView:MECarouselView) -> CGFloat
    @objc optional func scrollInsetsForMECarouselView() -> UIEdgeInsets
    
}
