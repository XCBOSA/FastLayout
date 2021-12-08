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
    
    public var viewStates = [FLViewState]()
    
    public func register(viewState: FLViewState) {
        self.viewStates.append(viewState)
    }
    
    public func triggerViewSizeChanged(width: CGFloat, height: CGFloat) {
        _ = self.viewStates.map({ $0.isActive = $0.checker(width, height) })
    }
}
