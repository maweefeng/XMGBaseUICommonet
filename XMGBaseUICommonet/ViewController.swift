

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func click(sender:UIButton){
        let vc = ImageScaleTVC()
        self.xmg_turnToViewController(vc)
    }

    
    
}

