//
//  File.swift
//  
//
//  Created by XCBOSA on 2021/12/4.
//

import UIKit

public class FLAnchorWithOffsetBaseClass: NSObject {
    public private(set) var offset: CGFloat
    public private(set) var multiplier: CGFloat
    public private(set) var anchorObject: NSObject
    
    init (anchorObject: NSObject, offset: CGFloat, multiplier: CGFloat) {
        self.anchorObject = anchorObject
        self.offset = offset
        self.multiplier = multiplier
    }
    
    func makeSureDefaultMultiplier() {
        if multiplier != 1 {
            fatalError("Constraint with NSLayoutXAxisAnchor or NSLayoutYAxisAnchor can't use multiplier or div operator.")
        }
    }
}

public class FLAnchorWithOffset<AnchorType>: FLAnchorWithOffsetBaseClass where AnchorType: NSObject {
    public private(set) var baseAnchor: NSLayoutAnchor<AnchorType>
    
    init (withAnchor anchor: NSLayoutAnchor<AnchorType>) {
        self.baseAnchor = anchor
        super.init(anchorObject: anchor, offset: 0, multiplier: 1)
    }
    
    init (withAnchor anchor: NSLayoutAnchor<AnchorType>, offset: CGFloat, multiplier: CGFloat) {
        self.baseAnchor = anchor
        super.init(anchorObject: anchor, offset: offset, multiplier: multiplier)
    }
    
    func getAnchor<AsType>() -> AsType {
        guard let anchor = baseAnchor as? AsType else {
            var classA = "[Not Objc Class]", classB = NSStringFromClass(AnchorType.self)
            if let type = AsType.self as? AnyClass {
                classA = NSStringFromClass(type)
            }
            fatalError("Constraint require \(classA), but got \(classB)")
        }
        return anchor
    }
    
    public static func + (lhs: FLAnchorWithOffset, rhs: CGFloat) -> FLAnchorWithOffset<AnchorType> {
        FLAnchorWithOffset(withAnchor: lhs.baseAnchor, offset: lhs.offset + rhs, multiplier: lhs.multiplier)
    }
    
    public static func - (lhs: FLAnchorWithOffset, rhs: CGFloat) -> FLAnchorWithOffset<AnchorType> {
        FLAnchorWithOffset(withAnchor: lhs.baseAnchor, offset: lhs.offset - rhs, multiplier: lhs.multiplier)
    }
    
    public static func * (lhs: FLAnchorWithOffset, rhs: CGFloat) -> FLAnchorWithOffset<AnchorType> {
        FLAnchorWithOffset(withAnchor: lhs.baseAnchor, offset: lhs.offset, multiplier: lhs.multiplier * rhs)
    }
    
    public static func / (lhs: FLAnchorWithOffset, rhs: CGFloat) -> FLAnchorWithOffset<AnchorType> {
        FLAnchorWithOffset(withAnchor: lhs.baseAnchor, offset: lhs.offset, multiplier: lhs.multiplier / rhs)
    }
}

@MainActor
public func FLCreateAndActiveConstraint<AnchorType>(_ lhs: AnchorType, _ rhs: FLAnchorWithOffset<AnchorType>, method: (AnchorType, FLAnchorWithOffset<AnchorType>) -> NSLayoutConstraint) -> NSLayoutConstraint {
    let constraint = method(lhs, rhs)
    constraint.isActive = true
    FLConstraintRecorder.standard.add(constraint: constraint)
    return constraint
}

extension NSLayoutDimension {
    public static func + (lhs: NSLayoutDimension, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutDimension> {
        FLAnchorWithOffset(withAnchor: lhs, offset: rhs, multiplier: 1)
    }
    
    public static func - (lhs: NSLayoutDimension, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutDimension> {
        FLAnchorWithOffset(withAnchor: lhs, offset: -rhs, multiplier: 1)
    }
    
    public static func * (lhs: NSLayoutDimension, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutDimension> {
        FLAnchorWithOffset(withAnchor: lhs, offset: 0, multiplier: rhs)
    }
    
    public static func / (lhs: NSLayoutDimension, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutDimension> {
        FLAnchorWithOffset(withAnchor: lhs, offset: 0, multiplier: 1 / rhs)
    }
}

extension NSLayoutXAxisAnchor {
    public static func + (lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutXAxisAnchor> {
        FLAnchorWithOffset(withAnchor: lhs, offset: rhs, multiplier: 1)
    }
    
    public static func - (lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutXAxisAnchor> {
        FLAnchorWithOffset(withAnchor: lhs, offset: -rhs, multiplier: 1)
    }
    
    public static func * (lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutXAxisAnchor> {
        FLAnchorWithOffset(withAnchor: lhs, offset: 0, multiplier: rhs)
    }
    
    public static func / (lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutXAxisAnchor> {
        FLAnchorWithOffset(withAnchor: lhs, offset: 0, multiplier: 1 / rhs)
    }
}

extension NSLayoutYAxisAnchor {
    public static func + (lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutYAxisAnchor> {
        FLAnchorWithOffset(withAnchor: lhs, offset: rhs, multiplier: 1)
    }
    
    public static func - (lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutYAxisAnchor> {
        FLAnchorWithOffset(withAnchor: lhs, offset: -rhs, multiplier: 1)
    }
    
    public static func * (lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutYAxisAnchor> {
        FLAnchorWithOffset(withAnchor: lhs, offset: 0, multiplier: rhs)
    }
    
    public static func / (lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> FLAnchorWithOffset<NSLayoutYAxisAnchor> {
        FLAnchorWithOffset(withAnchor: lhs, offset: 0, multiplier: 1 / rhs)
    }
}

