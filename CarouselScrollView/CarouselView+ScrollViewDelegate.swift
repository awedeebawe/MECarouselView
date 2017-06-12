
//
//  CarouselScrollView+ScrollViewDelegate.swift
//  CarouselScrollView
//
//  Created by Gabriel Bezerra Valério on 12/06/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

extension CarouselView : UIScrollViewDelegate {
    
    private func visibleViews() -> [UIView] {
        var visibleRect = CGRect(origin: scrollView.contentOffset, size: scrollView.bounds.size)
        let scale = 1.0 / scrollView.zoomScale
        visibleRect.origin.x *= scale
        visibleRect.origin.y *= scale
        visibleRect.size.width *= scale
        visibleRect.size.height *= scale
        
        var visibleViews:[UIView] = []
        
        for view in stackView.subviews where view.frame.intersects(visibleRect) {
            visibleViews.append(view)
        }
        
        return visibleViews
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollCenter = scrollView.frame.size.width / 2
        let offset = scrollView.contentOffset.x
        
        let visibleViews = self.visibleViews()
        for view in visibleViews {
            let normalizedCenter = view.center.x - offset
            let maxDistance = view.frame.size.width + stackView.spacing
            let distance = min(abs(scrollCenter - normalizedCenter), maxDistance)
            
            let ratio = (maxDistance - distance) / maxDistance
            let scale = ratio * (1 - self.standardItemScale) + self.standardItemScale
            
            view.layer.transform = CATransform3DScale(CATransform3DIdentity, scale, scale, 1.0)
            view.layer.zPosition = 10 * scale
        }
    }
    
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        self.delegate?.carouselView?(self, DidSnapTo: actualIndex)
    }
    
}
