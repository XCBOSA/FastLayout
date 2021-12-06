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
    $0.leftRight == self.view.leftRight
    $0.top == self.view.safeArea.top
    $0.height == 30                                     // Constraint to 30
}
self.view.arrangerAddSubview(button) {
    $0.leftTop == self.view.left & (label.bottom + 10)  // left = superLeft, top = label.bottom (offset 10)
    $0.right == self.view.right
    $0.height == label.height * 2                       // height = label.height (multiplier 2)
}
self.view.endArrangeSubviews()
```
### Example: Display MxN button matrix
```
self.view.beginArrangeSubviews()
        
var btns = [[UIButton]]()
let lineCount = 10
let columnCount = 10
for lineId in 0..<lineCount {
    var line = [UIButton]()
    for columnId in 0..<columnCount {
        let btn = UIButton()
        btn.backgroundColor = .cyan
        btn.setTitle("(\(lineId), \(columnId))", for: .normal)
        line.append(btn)
        self.view.arrangerAddSubview(btn) {
            if columnId == 0 {
                $0.left == self.view.left
            }
            if columnId == columnCount - 1 {
                $0.right == self.view.right
            }
            if lineId == 0 {
                $0.top == self.view.safeAreaLayoutGuide.topAnchor
            }
            if lineId == lineCount - 1 {
                $0.bottom == self.view.bottomAnchor
            }
            if columnId > 0 {
                $0.width == line[columnId - 1].width
                $0.left == line[columnId - 1].right + 1
            }
            if lineId > 0 {
                $0.height == btns[lineId - 1][columnId].height
                $0.top == btns[lineId - 1][columnId].bottom + 1
            }
        }
    }
    btns.append(line)
}

self.view.endArrangeSubviews()
```
