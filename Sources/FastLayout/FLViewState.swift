//
//  File.swift
//  
//
//  Created by XCBOSA on 2021/12/7.
//

import UIKit

public typealias FLViewStateCheckerBlock = (CGFloat, CGFloat) -> Bool

public class FLViewState {
    public private(set) var constraintGroup = [NSLayoutConstraint]()
    public private(set) var checker: FLViewStateCheckerBlock
    
    public init (checkerBlock: @escaping FLViewStateCheckerBlock) {
        self.checker = checkerBlock
    }
    
    public func append(_ constraintObject: NSLayoutConstraint) {
        constraintObject.isActive = isActive
        self.constraintGroup.append(constraintObject)
    }
    
    public func append(contentsOf contents: [NSLayoutConstraint]) {
        _ = contents.map({ self.append($0) })
    }
    
    public var isActive: Bool = false {
        didSet {
            _ = constraintGroup.map({ $0.isActive = isActive })
        }
    }
}

public class FLViewStateManager {
    public init () { }
    
    public var viewStates = [FLViewState]()
    
    public func register(viewState: FLViewState) {
        self.viewStates.append(viewState)
    }
    
    public func triggerViewSizeChanged(width: CGFloat, height: CGFloat) {
        let enableConstraints = viewStates.filter({ $0.checker(width, height) })
        let disableConstraints = viewStates.filter({ !$0.checker(width, height) })
        _ = enableConstraints.map({ $0.isActive = true })
        _ = disableConstraints.map({ $0.isActive = false })
    }
}
