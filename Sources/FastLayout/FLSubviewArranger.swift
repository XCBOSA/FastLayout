//
//  File.swift
//  
//
//  Created by XCBOSA on 2021/12/6.
//

import UIKit

public class FLUIViewWithConstraint {
    
    public private(set) var view: UIView
    public private(set) var constraintExpressions: () -> Void
    
    init (view: UIView, expression: @escaping () -> Void) {
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
    public func addSubview(subview: FLUIViewWithConstraint) -> FLSubviewArranger {
        subviews.append(subview)
        return self
    }
    
    @discardableResult
    public func addSubview(subview: UIView, constraintExpression: @escaping () -> Void) -> FLSubviewArranger {
        addSubview(subview: FLUIViewWithConstraint(view: subview, expression: constraintExpression))
    }
    
    public func finish() {
        guard let view = view else { return }
        view.addSubViews(subviews.map({ $0.view }))
        let _: [Void] = subviews.map({ $0.constraintExpressions() })
    }
    
}

extension UIView {
    
    public func arrangeSubview() -> FLSubviewArranger {
        return FLSubviewArranger(view: self)
    }
    
}
