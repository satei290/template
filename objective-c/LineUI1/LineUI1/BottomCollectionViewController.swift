//
//  BottomCollectionViewController.swift
//  LineUI1
//
//  Created by ishikura keisuke on 2016/10/09.
//  Copyright © 2016年 ishikura keisuke. All rights reserved.
//

import UIKit


class BottomCollectionViewController: UICollectionViewController {
    
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
        let cell:BottomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomCell", for: indexPath) as! BottomCollectionViewCell
        cell.stampImg.image = UIImage(named: stampImages[indexPath.item])
        cell.backgroundColor = UIColor.clear
        return cell
    }
}
