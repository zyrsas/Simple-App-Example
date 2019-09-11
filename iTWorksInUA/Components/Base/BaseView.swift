//
//  BaseView.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit
import SnapKit

class BaseView: UIView {
    
    var isLoaded = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    private func configure() {
        if !isLoaded && superview != nil {
            isLoaded = true
            
            addSubViews()
            setupUI()
            onViewLoaded()
        }
    }
    
    open func onViewLoaded() {
        
    }
    
    open func addSubViews() {
        
    }
    
    open func setupUI() {
    }
    
}
