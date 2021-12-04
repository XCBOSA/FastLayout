//
//  Utils.swift
//  
//
//  Created by XCBOSA on 2021/12/4.
//

import UIKit

extension UIView {
    
    public var left: NSLayoutXAxisAnchor {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.leftAnchor
    }
    
    public var right: NSLayoutXAxisAnchor {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.rightAnchor
    }
    
    public var leading: NSLayoutXAxisAnchor {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.leadingAnchor
    }
    
    public var trailing: NSLayoutXAxisAnchor {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.trailingAnchor
    }
    
    public var top: NSLayoutYAxisAnchor {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.topAnchor
    }
    
    public var bottom: NSLayoutYAxisAnchor {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.bottomAnchor
    }
    
    public var width: NSLayoutDimension {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.widthAnchor
    }
    
    public var height: NSLayoutDimension {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.heightAnchor
    }
    
    public var centerX: NSLayoutXAxisAnchor {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.centerXAnchor
    }
    
    public var centerY: NSLayoutYAxisAnchor {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.centerYAnchor
    }
    
    public var firstBaseLine: NSLayoutYAxisAnchor {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.firstBaselineAnchor
    }
    
    public var lastBaseLine: NSLayoutYAxisAnchor {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self.lastBaselineAnchor
    }
    
    public func addSubViews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    public func configureSubView(_ views: UIView ...) {
        self.addSubViews(views)
    }
    
}

public func FLCreateAndActiveConstraint<AnchorType>(_ lhs: NSLayoutAnchor<AnchorType>, _ rhs: NSLayoutAnchor<AnchorType>, method: (NSLayoutAnchor<AnchorType>, NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint) -> NSLayoutConstraint {
    let constraint = method(lhs, rhs)
    constraint.isActive = true
    return constraint
}

public func FLCreateAndActiveConstraint__<AnchorType>(_ lhs: AnchorType, _ rhs: CGFloat, method: (AnchorType, CGFloat) -> NSLayoutConstraint) -> NSLayoutConstraint {
    let constraint = method(lhs, rhs)
    constraint.isActive = true
    return constraint
}
