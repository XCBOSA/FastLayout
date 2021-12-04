import UIKit

extension NSLayoutDimension {
    public static func == (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(equalTo: $1) }
    }
    
    public static func == (lhs: NSLayoutDimension, rhs: FLAnchorWithOffset<NSLayoutDimension>) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(equalTo: $1.baseAnchor, constant: $1.offset) }
    }
    
    public static func <= (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(lessThanOrEqualTo: $1) }
    }
    
    public static func <= (lhs: NSLayoutDimension, rhs: FLAnchorWithOffset<NSLayoutDimension>) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(lessThanOrEqualTo: $1.baseAnchor, constant: $1.offset) }
    }
    
    public static func >= (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(greaterThanOrEqualTo: $1) }
    }
    
    public static func >= (lhs: NSLayoutDimension, rhs: FLAnchorWithOffset<NSLayoutDimension>) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(greaterThanOrEqualTo: $1.baseAnchor, constant: $1.offset) }
    }
}

extension NSLayoutXAxisAnchor {
    public static func == (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(equalTo: $1) }
    }
    
    public static func == (lhs: NSLayoutXAxisAnchor, rhs: FLAnchorWithOffset<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(equalTo: $1.baseAnchor, constant: $1.offset) }
    }
    
    public static func <= (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(lessThanOrEqualTo: $1) }
    }
    
    public static func <= (lhs: NSLayoutXAxisAnchor, rhs: FLAnchorWithOffset<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(lessThanOrEqualTo: $1.baseAnchor, constant: $1.offset) }
    }
    
    public static func >= (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(greaterThanOrEqualTo: $1) }
    }
    
    public static func >= (lhs: NSLayoutXAxisAnchor, rhs: FLAnchorWithOffset<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(greaterThanOrEqualTo: $1.baseAnchor, constant: $1.offset) }
    }
}

extension NSLayoutYAxisAnchor {
    public static func == (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(equalTo: $1) }
    }
    
    public static func == (lhs: NSLayoutYAxisAnchor, rhs: FLAnchorWithOffset<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(equalTo: $1.baseAnchor, constant: $1.offset) }
    }
    
    public static func <= (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(lessThanOrEqualTo: $1) }
    }
    
    public static func <= (lhs: NSLayoutYAxisAnchor, rhs: FLAnchorWithOffset<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(lessThanOrEqualTo: $1.baseAnchor, constant: $1.offset) }
    }
    
    public static func >= (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(greaterThanOrEqualTo: $1) }
    }
    
    public static func >= (lhs: NSLayoutYAxisAnchor, rhs: FLAnchorWithOffset<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        FLCreateAndActiveConstraint(lhs, rhs) { $0.constraint(greaterThanOrEqualTo: $1.baseAnchor, constant: $1.offset) }
    }
}
