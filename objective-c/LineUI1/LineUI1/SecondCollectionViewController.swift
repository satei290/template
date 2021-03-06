//
//  SecondCollectionViewController.swift
//  LineUI1
//
//  Created by ishikura keisuke on 2016/09/29.
//  Copyright © 2016年 ishikura keisuke. All rights reserved.
//

import UIKit


class SecondCollectionViewController: UICollectionViewController {
    
    var stampImages: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return stampImages.count
    }
    
    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell:SecondCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCell", for: indexPath) as! SecondCollectionViewCell
        cell.stampImg.image = UIImage(named: stampImages[indexPath.item])
        cell.backgroundColor = UIColor.clear
        return cell
    }

}
