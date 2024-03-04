//
//  sliderSplashVC.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 14/02/24.
//

import UIKit

class sliderSplashVC: UIViewController {
    
    @IBOutlet weak var slideimg: UIImageView!
    
    var images = ["Object1","Object2"]
    var timer = Timer()
    var photoCount:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        slideimg.image = UIImage.init(named: "Object1")
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTransition), userInfo: nil, repeats: true)
    }
    
    @objc func onTransition() {
        if (photoCount < images.count - 1){
            photoCount = photoCount  + 1;
        }else{
            photoCount = 0;
        }

        UIView.transition(with: self.slideimg, duration: 8.0, options: .transitionCrossDissolve, animations: {
            self.slideimg.image = UIImage.init(named: self.images[self.photoCount])
        }, completion: nil)
    }
   

    @IBAction func getstartedClicked(_ sender: Any)  {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
