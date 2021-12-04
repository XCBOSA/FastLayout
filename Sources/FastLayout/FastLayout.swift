import UIKit

extension NSLayoutDimension {
    @discardableResult
    public static func == (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(equalTo: $1) }
    }
    
    @discardableResult
    public static func == (lhs: NSLayoutDimension, rhs: FLAnchorWithOffset<NSLayoutDimension>) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(equalTo: $1.getAnchor(), multiplier: rhs.multiplier, constant: $1.offset) }
    }
    
    @discardableResult
    public static func <= (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(lessThanOrEqualTo: $1) }
    }
    
    @discardableResult
    public static func <= (lhs: NSLayoutDimension, rhs: FLAnchorWithOffset<NSLayoutDimension>) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(lessThanOrEqualTo: $1.getAnchor(), multiplier: rhs.multiplier, constant: $1.offset) }
    }
    
    @discardableResult
    public static func >= (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(greaterThanOrEqualTo: $1) }
    }
    
    @discardableResult
    public static func >= (lhs: NSLayoutDimension, rhs: FLAnchorWithOffset<NSLayoutDimension>) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(greaterThanOrEqualTo: $1.getAnchor(), multiplier: rhs.multiplier, constant: $1.offset) }
    }
}

extension NSLayoutXAxisAnchor {
    @discardableResult
    public static func == (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(equalTo: $1) }
    }
    
    @discardableResult
    public static func == (lhs: NSLayoutXAxisAnchor, rhs: FLAnchorWithOffset<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        rhs.makeSureDefaultMultiplier()
        return FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(equalTo: $1.baseAnchor, constant: $1.offset) }
    }
    
    @discardableResult
    public static func <= (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(lessThanOrEqualTo: $1) }
    }
    
    @discardableResult
    public static func <= (lhs: NSLayoutXAxisAnchor, rhs: FLAnchorWithOffset<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        rhs.makeSureDefaultMultiplier()
        return FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(lessThanOrEqualTo: $1.baseAnchor, constant: $1.offset) }
    }
    
    @discardableResult
    public static func >= (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(greaterThanOrEqualTo: $1) }
    }
    
    @discardableResult
    public static func >= (lhs: NSLayoutXAxisAnchor, rhs: FLAnchorWithOffset<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        rhs.makeSureDefaultMultiplier()
        return FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(greaterThanOrEqualTo: $1.baseAnchor, constant: $1.offset) }
    }
}

extension NSLayoutYAxisAnchor {
    @discardableResult
    public static func == (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(equalTo: $1) }
    }
    
    @discardableResult
    public static func == (lhs: NSLayoutYAxisAnchor, rhs: FLAnchorWithOffset<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        rhs.makeSureDefaultMultiplier()
        return FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(equalTo: $1.baseAnchor, constant: $1.offset) }
    }
    
    @discardableResult
    public static func <= (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(lessThanOrEqualTo: $1) }
    }
    
    @discardableResult
    public static func <= (lhs: NSLayoutYAxisAnchor, rhs: FLAnchorWithOffset<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        rhs.makeSureDefaultMultiplier()
        return FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(lessThanOrEqualTo: $1.baseAnchor, constant: $1.offset) }
    }
    
    @discardableResult
    public static func >= (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(greaterThanOrEqualTo: $1) }
    }
    
    @discardableResult
    public static func >= (lhs: NSLayoutYAxisAnchor, rhs: FLAnchorWithOffset<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        rhs.makeSureDefaultMultiplier()
        return FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(greaterThanOrEqualTo: $1.baseAnchor, constant: $1.offset) }
    }
}
