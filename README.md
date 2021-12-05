# FastLayout
  
FastLayout is a UIKit or AppKit package for fast UI design.  
  
### Layout Example
```
import FastLayout

self.view.beginArrangeSubviews()

let label = UILabel(); label.text = "Hello"
let button = UIButton(); button.setTitle("hello world", for: .normal)

self.view.arrangerAddSubview(subview: label) {
    $0.left == self.view.left
    $0.right == self.view.right
    $0.top == self.view.safeAreaLayoutGuide.topAnchor
    $0.height == 30
}

self.view.arrangerAddSubview(subview: button) {
    $0.left == self.view.left
    $0.right == self.view.right
    $0.top == label.bottom + 5       // Offset = 5
    $0.height == label.height * 2    // Multiplier = 2
}
        
self.view.endArrangeSubviews()
```
