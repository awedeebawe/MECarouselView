//
//  CarouselScrollView.swift
//  CarouselScrollView
//
//  Created by Gabriel Bezerra Valério on 12/06/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

public class MECarouselView: UIView {
    
    //MARK: - IBOutlets
    @IBOutlet weak var contentView:UIView!
    @IBOutlet weak var scrollView:UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    
    //MARK: - Properties
    private(set) var standardItemScale:CGFloat = 0.8
    private(set) var standardItemWidthMultiplier:CGFloat = 1.0
    private(set) var standardTopInset:CGFloat = .leastNonzeroMagnitude
    private(set) var standardBottomInset:CGFloat = .leastNonzeroMagnitude
    private(set) var sideInset:CGFloat = 0.0
    private(set) var numberOfViews:Int = 0
    
    private(set) var actualIndex:Int = 0
    
    public weak var dataSource:MECarouselViewDataSource? {
        didSet {
            guard dataSource != nil else { return }
            
            self.setupScrollView()
        }
    }
    public weak var delegate:MECarouselViewDelegate?
    
    private let nibName = "MECarouselView"
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        //Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        Bundle(for: MECarouselView.self).loadNibNamed(nibName, owner: self, options: nil)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentView)
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        scrollView.delegate = self
    }
    
    public func snapToView(at index:Int){
        guard index >= 0 && index < numberOfViews && index != actualIndex else {
            return
        }
        
        let viewWidth = stackView.frame.width / CGFloat(numberOfViews)
        let offsetX = viewWidth * CGFloat(index) - sideInset
        
        actualIndex = index
        delegate?.carouselView?(self, willSnapTo: index)
        scrollView.setContentOffset(CGPoint(x: offsetX, y: scrollView.contentOffset.y), animated: true)
    }
    
    private func setupScrollView(){
        standardItemWidthMultiplier = dataSource?.standardItemWidthMultiplierInMECarouselView(self) ?? 1.0
        standardItemScale = dataSource?.standardItemScaleInMECarouselView?(self) ?? 0.8
        standardTopInset = dataSource?.standardTopInsetInMECarouselView?(self) ?? .leastNonzeroMagnitude
        standardBottomInset = dataSource?.standardBottomInsetInMECarouselView?(self) ?? .leastNonzeroMagnitude
        
        sideInset = (scrollView.bounds.size.width * (1.0 - standardItemWidthMultiplier)) / 2
        scrollView.contentInset = UIEdgeInsetsMake(standardTopInset, sideInset, standardBottomInset, sideInset)
        
        scrollView.isScrollEnabled = dataSource?.isScrollAvaliableInMECarouselView?(self) ?? true
        
        insertViews()
    }
    
    private func insertViews(){
        guard dataSource != nil else {
            return
        }
        
        numberOfViews = dataSource?.numberOfViewsInMECarouselView(self) ?? 0
        
        for i in 0..<numberOfViews {
            let view = dataSource?.carouselView(self, viewForIndex: i)
            
            //let scrollLayoutGuide = stackView.layoutMarginsGuide
            //view?.widthAnchor.constraint(equalTo: scrollLayoutGuide.widthAnchor, multiplier: standardItemScale).isActive = true
            view?.widthAnchor.constraint(equalToConstant: scrollView.frame.size.width * standardItemWidthMultiplier).isActive = true
            stackView.addArrangedSubview(view!)
        }
    }
    
}
