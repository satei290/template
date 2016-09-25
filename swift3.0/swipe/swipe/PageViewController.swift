//
//  PageViewController.swift
//  swipe
//
//  Created by ishikurak73 on 2016/09/22.
//  Copyright © 2016年 ishikurak73. All rights reserved.
//

import UIKit


class PageViewController: UIPageViewController,UIPageViewControllerDataSource {
    
    let sboard: UIStoryboard? = UIStoryboard(name:"Main", bundle:nil)
    
    var pageViewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:UIImage(named: "backBokashi.png")!)
        //自分自身を指定
        dataSource = self
        let firstViewController: FirstViewController = sboard!.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        let secondViewController: SecondViewController = sboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        let thirdViewController: ThirdViewController = sboard!.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        pageViewControllers = [firstViewController,secondViewController,thirdViewController]
        setViewControllers([pageViewControllers[0]], direction: .forward, animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController:UIViewController) -> UIViewController? {
        //右にスワイプした場合に表示したいviewControllerを返す
        //ようはページを戻す
        let index = pageViewControllers.index(of: viewController)
        if index == 0 {
            return nil
        } else {
            return pageViewControllers[index!-1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //左にスワイプした場合に表示したいviewControllerを返す
        //ようはページを進める
        let index = pageViewControllers.index(of: viewController)
        if index == pageViewControllers.count-1 {
            return nil
        } else {
            return pageViewControllers[index!+1]
        }
    }
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int{
        return 1
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int{
        return 1
    }
}
