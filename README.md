# FastLayout
  
FastLayout is a UIKit or AppKit package for fast UI design.  
  
### Layout Example
```
let label = UILabel()
let button = UIButton()

self.view.configureSubview(label, button)

label.top == self.view.top
label.left == self.view.left
label.right == self.view.right
label.height == 30

button.top == label.bottom + 5     // Offset = 5
button.left == self.view.right
button.right == self.view.height
button.height == label.height * 2  // Multiplier = 2
```
