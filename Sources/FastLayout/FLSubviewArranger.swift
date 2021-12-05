//
//  File.swift
//  
//
//  Created by XCBOSA on 2021/12/6.
//

import UIKit

public class FLUIViewWithConstraint {
    
    public private(set) var view: UIView
    public private(set) var constraintExpressions: (UIView) -> Void
    
    init (view: UIView, expression: @escaping (UIView) -> Void) {
        self.view = view
        self.constraintExpressions = expression
    }
    
}

public class FLSubviewArranger {
    
    public private(set) var subviews: [FLUIViewWithConstraint] = [FLUIViewWithConstraint]()
    public private(set) weak var view: UIView?
    
    init (view: UIView) {
        self.view = view
    }
    
    @discardableResult
    public func addSubview(subviewWithConstraint subview: FLUIViewWithConstraint) -> FLSubviewArranger {
        subviews.append(subview)
        return self
    }
    
    @discardableResult
    public func addSubview(subview: UIView, _ constraintExpression: @escaping (UIView) -> Void) -> FLSubviewArranger {
        addSubview(subviewWithConstraint: FLUIViewWithConstraint(view: subview, expression: constraintExpression))
    }
    
    public func finish() {
        guard let view = view else { return }
        view.addSubViews(subviews.map({ $0.view }))
        let _: [Void] = subviews.map({ $0.constraintExpressions($0.view) })
    }
    
}

extension UIView {
    
    public var arranger: FLSubviewArranger {
        FLSubviewArranger(view: self)
    }
    
}
