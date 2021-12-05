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
    public func addSubview(subview: UIView) -> FLSubviewArranger {
        addSubview(subviewWithConstraint: FLUIViewWithConstraint(view: subview, expression: { _ in }))
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
    public func arrangerAddSubview(subviewWithConstraint subview: FLUIViewWithConstraint) -> FLSubviewArranger {
        arranger.addSubview(subviewWithConstraint: subview)
    }
    
    @discardableResult
    /// 如果当前UIView未进行beginArrangeSubviews()或已经调用endArrangeSubviews()，则创建一个新的Arranger并添加组件，否则使用当前UIView的Arranger添加组件
    /// - Parameter subview: 要添加的组件
    /// - Returns: Arranger
    public func arrangerAddSubview(subview: UIView) -> FLSubviewArranger {
        arranger.addSubview(subviewWithConstraint: FLUIViewWithConstraint(view: subview, expression: { _ in }))
    }
    
    @discardableResult
    /// 如果当前UIView未进行beginArrangeSubviews()或已经调用endArrangeSubviews()，则创建一个新的Arranger并添加组件，否则使用当前UIView的Arranger添加组件
    /// - Parameters:
    ///   - subview: 要添加的组件
    ///   - constraintExpression: 约束函数
    /// - Returns: Arranger
    public func arrangerAddSubview(subview: UIView, _ constraintExpression: @escaping (UIView) -> Void) -> FLSubviewArranger {
        arranger.addSubview(subviewWithConstraint: FLUIViewWithConstraint(view: subview, expression: constraintExpression))
    }
    
}
