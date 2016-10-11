//
//  BottomChangeViewController.swift
//  LineUI1
//
//  Created by ishikura keisuke on 2016/10/09.
//  Copyright © 2016年 ishikura keisuke. All rights reserved.
//

import UIKit

class BottomChangeViewController: UIViewController {
    @IBOutlet weak var collectionChamgeBtnImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionChamgeBtnImg.image = UIImage(named: "face01.png")
    }
}
