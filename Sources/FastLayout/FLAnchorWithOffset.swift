//
//  File.swift
//  
//
//  Created by XCBOSA on 2021/12/4.
//

import UIKit

public class FLAnchorWithOffset<AnchorType> where AnchorType: NSObject {
    public private(set) var baseAnchor: NSLayoutAnchor<AnchorType>
    public private(set) var offset: CGFloat
    
    init (withAnchor anchor: NSLayoutAnchor<AnchorType>, offset: CGFloat) {
        self.baseAnchor = anchor
        self.offset = offset
    }
}

public func FLCreateAndActiveConstraint<AnchorType>(_ lhs: NSLayoutAnchor<AnchorType>, _ rhs: FLAnchorWithOffset<AnchorType>, method: (NSLayoutAnchor<AnchorType>, FLAnchorWithOffset<AnchorType>) -> NSLayoutConstraint) -> NSLayoutConstraint {
    let constraint = method(lhs, rhs)
    constraint.isActive = true
    return constraint
}

extension NSLayoutDimension {
    public static func + (lhs: NSLayoutDimension, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutDimension> {
        FLAnchorWithOffset(withAnchor: lhs, offset: rhs)
    }
    public static func - (lhs: NSLayoutDimension, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutDimension> {
        FLAnchorWithOffset(withAnchor: lhs, offset: -rhs)
    }
}

extension NSLayoutXAxisAnchor {
    public static func + (lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutXAxisAnchor> {
        FLAnchorWithOffset(withAnchor: lhs, offset: rhs)
    }
    public static func - (lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutXAxisAnchor> {
        FLAnchorWithOffset(withAnchor: lhs, offset: -rhs)
    }
}

extension NSLayoutYAxisAnchor {
    public static func + (lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutYAxisAnchor> {
        FLAnchorWithOffset(withAnchor: lhs, offset: rhs)
    }
    public static func - (lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutYAxisAnchor> {
        FLAnchorWithOffset(withAnchor: lhs, offset: -rhs)
    }
}

