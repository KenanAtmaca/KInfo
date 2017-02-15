# KInfo
Create Basic İOS Tip View

- Basic Example

```Swift
import UIKit

class testVC: UIViewController {

    var infoV:KInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        infoV = KInfo(text: "Hello!", to: self.view)
        infoV.setup()
        infoV.show(to: CGPoint(x: 150, y: 150))

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        infoV.dismiss(time: 1)
        
    }
}
```
