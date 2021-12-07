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
    
    public var centerXY: FLAnchorGroup { self.centerX & self.centerY }
    public var centerYX: FLAnchorGroup { self.centerY & self.centerX }
    public var leftTop: FLAnchorGroup { self.left & self.top }
    public var rightTop: FLAnchorGroup { self.right & self.top }
    public var leftBottom: FLAnchorGroup { self.left & self.bottom }
    public var rightBottom: FLAnchorGroup { self.right & self.bottom }
    public var topLeft: FLAnchorGroup { self.top & self.left }
    public var topRight: FLAnchorGroup { self.top & self.right }
    public var bottomLeft: FLAnchorGroup { self.bottom & self.left }
    public var bottomRight: FLAnchorGroup { self.bottom & self.right }
    public var leftRight: FLAnchorGroup { self.left & self.right }
    public var rightLeft: FLAnchorGroup { self.right & self.left }
    public var topBottom: FLAnchorGroup { self.top & self.bottom }
    public var bottomTop: FLAnchorGroup { self.bottom & self.top }
    public var size: FLAnchorGroup { self.width & self.height }
    
    public var safeArea: UILayoutGuide {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide
        } else {
            fatalError("Not support before iOS11.")
        }
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

extension UILayoutGuide {
    
    public var left: NSLayoutXAxisAnchor {
        return self.leftAnchor
    }
    
    public var right: NSLayoutXAxisAnchor {
        return self.rightAnchor
    }
    
    public var leading: NSLayoutXAxisAnchor {
        return self.leadingAnchor
    }
    
    public var trailing: NSLayoutXAxisAnchor {
        return self.trailingAnchor
    }
    
    public var top: NSLayoutYAxisAnchor {
        return self.topAnchor
    }
    
    public var bottom: NSLayoutYAxisAnchor {
        return self.bottomAnchor
    }
    
    public var width: NSLayoutDimension {
        return self.widthAnchor
    }
    
    public var height: NSLayoutDimension {
        return self.heightAnchor
    }
    
    public var centerX: NSLayoutXAxisAnchor {
        return self.centerXAnchor
    }
    
    public var centerY: NSLayoutYAxisAnchor {
        return self.centerYAnchor
    }
    
    public var centerXY: FLAnchorGroup { self.centerX & self.centerY }
    public var centerYX: FLAnchorGroup { self.centerY & self.centerX }
    public var leftTop: FLAnchorGroup { self.left & self.top }
    public var rightTop: FLAnchorGroup { self.right & self.top }
    public var leftBottom: FLAnchorGroup { self.left & self.bottom }
    public var rightBottom: FLAnchorGroup { self.right & self.bottom }
    public var topLeft: FLAnchorGroup { self.top & self.left }
    public var topRight: FLAnchorGroup { self.top & self.right }
    public var bottomLeft: FLAnchorGroup { self.bottom & self.left }
    public var bottomRight: FLAnchorGroup { self.bottom & self.right }
    public var leftRight: FLAnchorGroup { self.left & self.right }
    public var rightLeft: FLAnchorGroup { self.right & self.left }
    public var topBottom: FLAnchorGroup { self.top & self.bottom }
    public var bottomTop: FLAnchorGroup { self.bottom & self.top }
    public var size: FLAnchorGroup { self.width & self.height }
    
}

@MainActor
public func FLCreateAndActiveConstraint<AnchorType>(_ lhs: NSLayoutAnchor<AnchorType>, _ rhs: NSLayoutAnchor<AnchorType>, method: (NSLayoutAnchor<AnchorType>, NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint) -> NSLayoutConstraint {
    let constraint = method(lhs, rhs)
    constraint.isActive = true
    FLConstraintRecorder.standard.add(constraint: constraint)
    return constraint
}

@MainActor
public func FLCreateAndActiveConstraint__<AnchorType>(_ lhs: AnchorType, _ rhs: CGFloat, method: (AnchorType, CGFloat) -> NSLayoutConstraint) -> NSLayoutConstraint {
    let constraint = method(lhs, rhs)
    constraint.isActive = true
    FLConstraintRecorder.standard.add(constraint: constraint)
    return constraint
}
