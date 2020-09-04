//
//  SecondViewController.swift
//  deneme
//
//  Created by mac on 3.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
struct values {
    var country : String
    var totalCases : String
}
class SecondViewController: UIViewController {
    var values : [String] = []
    @IBOutlet var totalDeathLabel: UILabel!
    @IBOutlet var totalCasesLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var newCasesLabel: UILabel!
    @IBOutlet var newDeathLabel: UILabel!
    @IBOutlet var activeCasesLabel: UILabel!
    @IBOutlet var totalRecoveredLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        countryLabel.text = values[0]
        totalCasesLabel.text = values [1]
        newCasesLabel.text = values [2]
        totalDeathLabel.text = values [3]
        newDeathLabel.text = values [4]
        totalRecoveredLabel.text = values [5]
        activeCasesLabel.text = values [6]
        
        
        
        let jeremyGif = UIImage.gifImageWithName("b")
        let imageView = UIImageView(image: jeremyGif)
        imageView.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: self.view.frame.size.width - 100)
        view.addSubview(imageView)
    }
    

    

}
