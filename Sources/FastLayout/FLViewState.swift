//
//  File.swift
//  
//
//  Created by XCBOSA on 2021/12/7.
//

import UIKit

public typealias FLViewStateCheckerBlock = (CGFloat, CGFloat) -> Bool

public let FLViewStateCheckerBlockHorizontal: FLViewStateCheckerBlock = { $0 > $1 }
public let FLViewStateCheckerBlockPortrait: FLViewStateCheckerBlock = { $0 < $1 }

public class FLViewState {
    public private(set) var constraintGroup = [NSLayoutConstraint]()
    public private(set) var checker: FLViewStateCheckerBlock
    public private(set) var recorder: FLConstraintRecorder?
    
    fileprivate var isExtensionCreated: Bool = false
    
    public init (checkerBlock: @escaping FLViewStateCheckerBlock) {
        self.checker = checkerBlock
    }
    
    public init (configureWithRecorder recorder: FLConstraintRecorder, checkerBlock: @escaping FLViewStateCheckerBlock) {
        self.checker = checkerBlock
        self.recorder = recorder
        self.recorder!.beginRecord()
    }
    
    public func append(_ constraintObject: NSLayoutConstraint) {
        constraintObject.isActive = isActive
        self.constraintGroup.append(constraintObject)
    }
    
    public func append(contentsOf contents: [NSLayoutConstraint]) {
        _ = contents.map({ self.append($0) })
    }
    
    public func finishRecorder() {
        guard let recorder = self.recorder else {
            fatalError("FLViewState.finishRecorder() must called on object which init with init(configureWithRecorder: checkerBlock:), or FLViewState.finishRecorder() has already called on this object.")
        }
        self.append(contentsOf: recorder.endRecord())
        self.recorder = nil
    }
    
    public var isActive: Bool = false {
        didSet {
            _ = constraintGroup.map({ $0.isActive = isActive })
        }
    }
}

public class FLViewStateManager {
    public init () { }
    
    public private(set) var viewStates = [FLViewState]()
    
    public func register(viewState: FLViewState) {
        self.viewStates.append(viewState)
    }
    
    public func triggerViewSizeChanged(width: CGFloat, height: CGFloat) {
        _ = self.viewStates.map({ $0.isActive = $0.checker(width, height) })
    }
}

extension FLViewStateManager {
    
    public typealias ConstraintLoader = () -> Void
    
    public func configure(withHorizontal horizontal: ConstraintLoader, portrait: ConstraintLoader, horizontalBlock: FLViewStateCheckerBlock? = nil, portraitBlock: FLViewStateCheckerBlock? = nil) {
        if self.viewStates.count > 0 {
            fatalError("FLViewStateManager.configureWith(horizontal: portrait:) can't called after register(viewState:) called.")
        }
        let horizontalState = FLViewState(configureWithRecorder: .standard, checkerBlock: horizontalBlock ?? FLViewStateCheckerBlockHorizontal)
        horizontalState.isExtensionCreated = true
        horizontal()
        horizontalState.finishRecorder()
        let portraitState = FLViewState(configureWithRecorder: .standard, checkerBlock: portraitBlock ?? FLViewStateCheckerBlockPortrait)
        portraitState.isExtensionCreated = true
        portrait()
        portraitState.finishRecorder()
        self.register(viewState: horizontalState)
        self.register(viewState: portraitState)
    }
    
    public var horizontalState: FLViewState {
        if self.viewStates.count < 2 {
            fatalError("FLViewStateManager.horizontalState can't called before FLViewStateManager.configureWith(horizontal: portrait:)")
        }
        if !self.viewStates[0].isExtensionCreated {
            fatalError("FLViewStateManager.horizontalState can't called on FLViewStateManager instance where created by register(viewState:)")
        }
        return self.viewStates[0]
    }
    
    public var portraitState: FLViewState {
        if self.viewStates.count < 2 {
            fatalError("FLViewStateManager.portraitState can't called before FLViewStateManager.configureWith(horizontal: portrait:)")
        }
        if !self.viewStates[1].isExtensionCreated {
            fatalError("FLViewStateManager.portraitState can't called on FLViewStateManager instance where created by register(viewState:)")
        }
        return self.viewStates[1]
    }
    
}
