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
    
    public private(set) var subviews = [FLUIViewWithConstraint]()
    public private(set) var constraintExpressions = [() -> Void]()
    public private(set) weak var view: UIView?
    
    init (view: UIView) {
        self.view = view
    }
    
    @discardableResult
    public func add(subviewWithConstraint subview: FLUIViewWithConstraint) -> FLSubviewArranger {
        subviews.append(subview)
        return self
    }
    
    @discardableResult
    public func addSubview(_ subview: UIView) -> FLSubviewArranger {
        add(subviewWithConstraint: FLUIViewWithConstraint(view: subview, expression: { _ in }))
    }
    
    @discardableResult
    public func addSubview(_ subview: UIView, _ constraintExpression: @escaping (UIView) -> Void) -> FLSubviewArranger {
        add(subviewWithConstraint: FLUIViewWithConstraint(view: subview, expression: constraintExpression))
    }
    
    @discardableResult
    public func addConstraintExpression(_ expression: @escaping () -> Void) -> FLSubviewArranger {
        self.constraintExpressions.append(expression)
        return self
    }
    
    public func finish() {
        guard let view = view else { return }
        _ = subviews.map({ $0.view.translatesAutoresizingMaskIntoConstraints = false })
        view.addSubViews(subviews.map({ $0.view }))
        let _: [Void] = subviews.map({ $0.constraintExpressions($0.view) })
        let _: [Void] = constraintExpressions.map({ $0() })
    }
    
}

fileprivate var globalViewArrangerTable = [UIView : FLSubviewArranger]()

extension UIView {
    
    /// 获取一个Arranger，如果当前UIView未进行beginArrangeSubviews()或已经调用endArrangeSubviews()，则返回一个新的Arranger，否则返回当前UIView的Arranger
    public var arranger: FLSubviewArranger {
        if let arranger = globalViewArrangerTable[self] {
            return arranger
        }
        return FLSubviewArranger(view: self)
    }
    
    /// 开始为当前UIView布局，将此UIView附加一个新的Arranger
    public func beginArrangeSubviews() {
        if globalViewArrangerTable[self] != nil {
            fatalError("View has been already begin arranged, but call beginArrangeSubviews() again.")
        }
        globalViewArrangerTable[self] = FLSubviewArranger(view: self)
    }
    
    /// 结束当前UIView布局，应用布局并删除当前UIView的Arranger
    public func endArrangeSubviews() {
        if let arranger = globalViewArrangerTable[self] {
            arranger.finish()
            globalViewArrangerTable.removeValue(forKey: self)
        } else {
            fatalError("View was not begin arranged, need call beginArrangeSubviews() first.")
        }
    }
    
    @discardableResult
    /// 如果当前UIView未进行beginArrangeSubviews()或已经调用endArrangeSubviews()，则创建一个新的Arranger并添加组件，否则使用当前UIView的Arranger添加组件
    /// - Parameter subview: 要添加的组件
    /// - Returns: Arranger
    public func arrangerAdd(subviewWithConstraint subview: FLUIViewWithConstraint) -> FLSubviewArranger {
        arranger.add(subviewWithConstraint: subview)
    }
    
    @discardableResult
    /// 如果当前UIView未进行beginArrangeSubviews()或已经调用endArrangeSubviews()，则创建一个新的Arranger并添加组件，否则使用当前UIView的Arranger添加组件
    /// - Parameter subview: 要添加的组件
    /// - Returns: Arranger
    public func arrangerAddSubview(_ subview: UIView) -> FLSubviewArranger {
        arranger.add(subviewWithConstraint: FLUIViewWithConstraint(view: subview, expression: { _ in }))
    }
    
    @discardableResult
    /// 如果当前UIView未进行beginArrangeSubviews()或已经调用endArrangeSubviews()，则创建一个新的Arranger并添加约束表达式，否则使用当前UIView的Arranger添加约束表达式
    /// - Parameter expression: 约束表达式
    /// - Returns: Arranger
    public func arrangerAddConstraintExpression(_ expression: @escaping () -> Void) -> FLSubviewArranger {
        arranger.addConstraintExpression(expression)
    }
    
    @discardableResult
    /// 如果当前UIView未进行beginArrangeSubviews()或已经调用endArrangeSubviews()，则创建一个新的Arranger并添加组件，否则使用当前UIView的Arranger添加组件
    /// - Parameters:
    ///   - subview: 要添加的组件
    ///   - constraintExpression: 约束函数
    /// - Returns: Arranger
    public func arrangerAddSubview(_ subview: UIView, _ constraintExpression: @escaping (UIView) -> Void) -> FLSubviewArranger {
        arranger.add(subviewWithConstraint: FLUIViewWithConstraint(view: subview, expression: constraintExpression))
    }
    
}
