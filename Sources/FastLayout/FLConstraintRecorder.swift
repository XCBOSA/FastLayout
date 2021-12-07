//
//  File.swift
//  
//
//  Created by XCBOSA on 2021/12/7.
//

import UIKit

@MainActor
public class FLConstraintRecorder {
    
    public static let standard = FLConstraintRecorder()
    
    var constraints: [NSLayoutConstraint]?
    
    func add(constraint: NSLayoutConstraint) {
        guard constraints != nil else { return }
        constraints!.append(constraint)
    }
    
    public func beginRecord() {
        constraints = [NSLayoutConstraint]()
    }
    
    public func endRecord() -> [NSLayoutConstraint] {
        let copyConstraints = self.constraints
        self.constraints = [NSLayoutConstraint]()
        return copyConstraints ?? [NSLayoutConstraint]()
    }
    
}

