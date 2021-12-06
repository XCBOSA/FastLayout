//
//  File.swift
//  
//
//  Created by XCBOSA on 2021/12/6.
//

import UIKit

public class FLAnchorGroup {
    
    public private(set) var anchors: [FLAnchorWithOffsetBaseClass]
    
    init (withAnchors anchors: [FLAnchorWithOffsetBaseClass]) {
        self.anchors = anchors
    }
    
    public static func & (lhs: FLAnchorGroup, rhs: NSLayoutDimension) -> FLAnchorGroup {
        var anchors = lhs.anchors
        anchors.append(FLAnchorWithOffset<NSLayoutDimension>(withAnchor: rhs))
        return FLAnchorGroup(withAnchors: anchors)
    }
    
    public static func & (lhs: FLAnchorGroup, rhs: NSLayoutXAxisAnchor) -> FLAnchorGroup {
        var anchors = lhs.anchors
        anchors.append(FLAnchorWithOffset<NSLayoutXAxisAnchor>(withAnchor: rhs))
        return FLAnchorGroup(withAnchors: anchors)
    }
    
    public static func & (lhs: FLAnchorGroup, rhs: NSLayoutYAxisAnchor) -> FLAnchorGroup {
        var anchors = lhs.anchors
        anchors.append(FLAnchorWithOffset<NSLayoutYAxisAnchor>(withAnchor: rhs))
        return FLAnchorGroup(withAnchors: anchors)
    }
    
    public static func & (lhs: FLAnchorGroup, rhs: FLAnchorWithOffsetBaseClass) -> FLAnchorGroup {
        var anchors = lhs.anchors
        anchors.append(rhs)
        return FLAnchorGroup(withAnchors: anchors)
    }
    
    public static func == (lhs: FLAnchorGroup, rhs: FLAnchorGroup) {
        if lhs.anchors.count != rhs.anchors.count {
            fatalError("Constraint expression specified \(lhs.anchors.count) anchors left doesn't match \(rhs.anchors.count) in right.")
        }
        for it in 0..<lhs.anchors.count {
            let leftAnchor = lhs.anchors[it]
            let rightAnchor = rhs.anchors[it]
            leftAnchor == rightAnchor
        }
    }
    
}

extension NSLayoutDimension {
    
    public static func & (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            FLAnchorWithOffset<NSLayoutDimension>(withAnchor: lhs),
            FLAnchorWithOffset<NSLayoutDimension>(withAnchor: rhs)
        ])
    }
    
    public static func & (lhs: NSLayoutDimension, rhs: NSLayoutXAxisAnchor) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            FLAnchorWithOffset<NSLayoutDimension>(withAnchor: lhs),
            FLAnchorWithOffset<NSLayoutXAxisAnchor>(withAnchor: rhs)
        ])
    }
    
    public static func & (lhs: NSLayoutDimension, rhs: NSLayoutYAxisAnchor) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            FLAnchorWithOffset<NSLayoutDimension>(withAnchor: lhs),
            FLAnchorWithOffset<NSLayoutYAxisAnchor>(withAnchor: rhs)
        ])
    }
    
    public static func & (lhs: NSLayoutDimension, rhs: FLAnchorWithOffsetBaseClass) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            FLAnchorWithOffset<NSLayoutDimension>(withAnchor: lhs),
            rhs
        ])
    }
    
}

extension NSLayoutXAxisAnchor {
    
    public static func & (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutDimension) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            FLAnchorWithOffset<NSLayoutXAxisAnchor>(withAnchor: lhs),
            FLAnchorWithOffset<NSLayoutDimension>(withAnchor: rhs)
        ])
    }
    
    public static func & (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            FLAnchorWithOffset<NSLayoutXAxisAnchor>(withAnchor: lhs),
            FLAnchorWithOffset<NSLayoutXAxisAnchor>(withAnchor: rhs)
        ])
    }
    
    public static func & (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutYAxisAnchor) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            FLAnchorWithOffset<NSLayoutXAxisAnchor>(withAnchor: lhs),
            FLAnchorWithOffset<NSLayoutYAxisAnchor>(withAnchor: rhs)
        ])
    }
    
    public static func & (lhs: NSLayoutXAxisAnchor, rhs: FLAnchorWithOffsetBaseClass) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            FLAnchorWithOffset<NSLayoutXAxisAnchor>(withAnchor: lhs),
            rhs
        ])
    }
    
}

extension NSLayoutYAxisAnchor {
    
    public static func & (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutDimension) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            FLAnchorWithOffset<NSLayoutYAxisAnchor>(withAnchor: lhs),
            FLAnchorWithOffset<NSLayoutDimension>(withAnchor: rhs)
        ])
    }
    
    public static func & (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutXAxisAnchor) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            FLAnchorWithOffset<NSLayoutYAxisAnchor>(withAnchor: lhs),
            FLAnchorWithOffset<NSLayoutXAxisAnchor>(withAnchor: rhs)
        ])
    }
    
    public static func & (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            FLAnchorWithOffset<NSLayoutYAxisAnchor>(withAnchor: lhs),
            FLAnchorWithOffset<NSLayoutYAxisAnchor>(withAnchor: rhs)
        ])
    }
    
    public static func & (lhs: NSLayoutYAxisAnchor, rhs: FLAnchorWithOffsetBaseClass) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            FLAnchorWithOffset<NSLayoutYAxisAnchor>(withAnchor: lhs),
            rhs
        ])
    }
    
}

extension FLAnchorWithOffsetBaseClass {
    
    public static func & (lhs: FLAnchorWithOffsetBaseClass, rhs: NSLayoutDimension) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            lhs,
            FLAnchorWithOffset<NSLayoutDimension>(withAnchor: rhs)
        ])
    }
    
    public static func & (lhs: FLAnchorWithOffsetBaseClass, rhs: NSLayoutXAxisAnchor) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            lhs,
            FLAnchorWithOffset<NSLayoutXAxisAnchor>(withAnchor: rhs)
        ])
    }
    
    public static func & (lhs: FLAnchorWithOffsetBaseClass, rhs: NSLayoutYAxisAnchor) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            lhs,
            FLAnchorWithOffset<NSLayoutYAxisAnchor>(withAnchor: rhs)
        ])
    }
    
    public static func & (lhs: FLAnchorWithOffsetBaseClass, rhs: FLAnchorWithOffsetBaseClass) -> FLAnchorGroup {
        FLAnchorGroup(withAnchors: [
            lhs,
            rhs
        ])
    }
    
}

extension FLAnchorWithOffsetBaseClass {
    
    @discardableResult
    public static func == (lhs: FLAnchorWithOffsetBaseClass, rhs: FLAnchorWithOffsetBaseClass) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        lhs.makeSureDefaultMultiplier()
        let offset = rhs.offset - lhs.offset
        let multiplier = rhs.multiplier
        if let lhsAnchor = lhs.anchorObject as? NSLayoutDimension {
            guard let rhsAnchor = rhs.anchorObject as? NSLayoutDimension else {
                fatalError("Constraint expression left is NSLayoutDimesion, but right isn't.")
            }
            constraints.append(lhsAnchor == rhsAnchor * multiplier + offset)
        }
        if let lhsAnchor = lhs.anchorObject as? NSLayoutXAxisAnchor {
            guard let rhsAnchor = rhs.anchorObject as? NSLayoutXAxisAnchor else {
                fatalError("Constraint expression left is NSLayoutXAxisAnchor, but right isn't.")
            }
            constraints.append(lhsAnchor == rhsAnchor * multiplier + offset)
        }
        if let lhsAnchor = lhs.anchorObject as? NSLayoutYAxisAnchor {
            guard let rhsAnchor = rhs.anchorObject as? NSLayoutYAxisAnchor else {
                fatalError("Constraint expression left is NSLayoutYAxisAnchor, but right isn't.")
            }
            constraints.append(lhsAnchor == rhsAnchor * multiplier + offset)
        }
        return constraints
    }
    
}
