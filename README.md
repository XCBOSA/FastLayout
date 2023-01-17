# FastLayout

### FastLayout is a package that use symbol overloading to let you write constraint more enjoyable. Here is a small example to describe what FastLayout can do.

Before using FastLayout, to add a constraint in autolayout, you should do:
```swift
XXX.translatesAutoresizingMaskIntoConstraints = false
XXX.left.constraint(equalTo: YYY.leftAnchor).isActive = true
```
after import FastLayout, you only need to:
```swift
XXX.left == YYY.left
```

This is FastLayout, and I support UIKit / AppKit.

## Installation
> Just add this project using SwiftPackageManager.
> https://github.com/XCBOSA/FastLayout.git

## Usage
1. import FastLayout
2. Remove all XXX.translatesAutoresizingMaskIntoConstraints = false
3. label.left == self.view.leftAnchor

## Notice
When you using XXX.left (without Anchor) member, fastlayout will auto execute `XXX.translatesAutoresizingMaskIntoConstraints = false`, that may cause confusion if the XXX view not use AutoLayout to manage, such as UIViewController's view, and many system views.

To avoid this, please use `XXX.left == self.view.leftAnchor`.

## Help Needed
And also I want a star:)
