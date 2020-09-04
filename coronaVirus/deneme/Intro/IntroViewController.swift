//
//  IntroViewController.swift
//  deneme
//
//  Created by mac on 3.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import SystemConfiguration

class IntroViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let jeremyGif = UIImage.gifImageWithName("tenor")
        let imageView = UIImageView(image: jeremyGif)
        imageView.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: self.view.frame.size.width - 100)
        view.addSubview(imageView)
    }

    override func viewDidAppear(_ animated: Bool) {
        let internetConnection : Bool = isOnline()
        
        if internetConnection == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.performSegue(withIdentifier: "firstSegue", sender: self)            }
        } else {
            
        }
    }
    
    func isOnline() -> Bool {
        
            var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
            zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
            zeroAddress.sin_family = sa_family_t(AF_INET)
            
            let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                    SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
                }
            }
            
            var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
            if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
                return false
            }
            
            let isReachable = flags == .reachable
            let needsConnection = flags == .connectionRequired
            return isReachable && !needsConnection
            
    }
    
   
  
}
