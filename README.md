# FastLayout
  
FastLayout is a UIKit or AppKit package for fast UI design.  
  
### Layout Example
```
import FastLayout

// MARK: - Create and configure subviews
let label = UILabel()
let button = UIButton()
label.text = "Hello"
label.textAlignment = .center
button.setTitle("hello world", for: .normal)
button.setTitleColor(.link, for: .normal)

// MARK: - Arrange subview layout
self.view.beginArrangeSubviews()
self.view.arrangerAddSubview(label) {
    $0.leftTop == self.view.left & self.view.safeAreaLayoutGuide.topAnchor
    $0.right == self.view.right
    $0.height == 30                                     // Constraint to 30
}
self.view.arrangerAddSubview(button) {
    $0.leftTop == self.view.left & (label.bottom + 10)  // left = superLeft, top = label.bottom (offset 10)
    $0.right == self.view.right
    $0.height == label.height * 2                       // height = label.height (multiplier 2)
}
self.view.endArrangeSubviews()
```
